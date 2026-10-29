data "google_storage_project_service_account" "gcs_account" {
  project = module.bootstrap[local.bootstrap_project].project_id
  depends_on = [
    module.bootstrap
  ]
}

module "kms_state_bucket" {
  source               = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms?ref=dev"
  project_id           = module.bootstrap[local.bootstrap_project].project_id
  location             = var.kms.key_location
  keyring              = var.kms.key_ring_name
  keys                 = var.kms.encryption_keys
  purpose              = "ENCRYPT_DECRYPT"
  key_protection_level = "HSM"
  set_owners_for       = var.kms.encryption_keys
  owners               = ["${one(module.service_accounts[local.bootstrap_project].service_account_member)}"]
  set_decrypters_for   = var.kms.encryption_keys
  set_encrypters_for   = var.kms.encryption_keys
  decrypters           = ["${data.google_storage_project_service_account.gcs_account.member}"]
  encrypters           = ["${data.google_storage_project_service_account.gcs_account.member}"]

  depends_on = [
    module.bootstrap
  ]

}

resource "google_storage_bucket" "org_terraform_state" {
  project                     = module.bootstrap[local.bootstrap_project].project_id
  name                        = var.bucket.name
  location                    = var.bucket.region
  force_destroy               = var.bucket.force_destroy
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }

  dynamic "encryption" {
    for_each = var.bucket.encrypt_gcs_bucket_tfstate ? ["encryption"] : []
    content {
      default_kms_key_name = one([for v in module.kms_state_bucket.keys : v])
    }
  }
  depends_on = [
    module.bootstrap
  ]
}
