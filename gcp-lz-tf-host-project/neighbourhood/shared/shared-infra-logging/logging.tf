data "google_storage_project_service_account" "gcs_account" {
  project = local.project_id
  depends_on = [
    module.projects_factories
  ]
}
module "kms_logsink" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms?ref=dev"

  project_id           = local.project_id
  location             = var.log_sink_bucket.key_location
  keyring              = var.log_sink_bucket.key_ring_name
  keys                 = var.log_sink_bucket.encryption_keys
  purpose              = "ENCRYPT_DECRYPT"
  key_protection_level = "HSM"
  set_decrypters_for   = var.log_sink_bucket.encryption_keys
  set_encrypters_for   = var.log_sink_bucket.encryption_keys
  decrypters           = ["${data.google_storage_project_service_account.gcs_account.member}"]
  encrypters           = ["${data.google_storage_project_service_account.gcs_account.member}"]
}

module "log_export_bucket" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "~> 7.0"
  destination_uri        = module.destination_bucket.destination_uri
  filter                 = var.log_sink_bucket.filter
  log_sink_name          = var.log_sink_bucket.name
  parent_resource_id     = var.org_id
  parent_resource_type   = "organization"
  unique_writer_identity = true
  include_children       = true
}

module "destination_bucket" {
  source                      = "terraform-google-modules/log-export/google//modules/storage"
  version                     = "~> 7.0"
  project_id                  = local.project_id
  storage_bucket_name         = var.log_sink_bucket.bucket_name
  log_sink_writer_identity    = module.log_export_bucket.writer_identity
  location                    = var.log_sink_bucket.bucket_location
  uniform_bucket_level_access = true
  versioning                  = false
  kms_key_name                = one([for v in module.kms_logsink.keys : v])
  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age        = var.log_sink_bucket.lifecycle_rule_delete_age
        with_state = "ANY"
      }
    },
    {
      action = {
        type          = "SetStorageClass"
        storage_class = var.log_sink_bucket.lifecycle_rule_storage_class
      }
      condition = {
        age        = var.log_sink_bucket.lifecycle_rule_storage_class_age
        with_state = "ANY"
      }
    }
  ]
}

module "kms_logsink_pubsub" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms?ref=dev"

  project_id           = local.project_id
  location             = var.log_sink_pubsub.key_location
  keyring              = var.log_sink_pubsub.key_ring_name
  keys                 = var.log_sink_pubsub.encryption_keys
  purpose              = "ENCRYPT_DECRYPT"
  key_protection_level = "HSM"
  set_decrypters_for   = var.log_sink_pubsub.encryption_keys
  set_encrypters_for   = var.log_sink_pubsub.encryption_keys
  decrypters           = ["serviceAccount:service-${local.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"]
  encrypters           = ["serviceAccount:service-${local.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"]
}


module "log_export_pubsub" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "~> 7.0"
  destination_uri        = module.destination_pubsub.destination_uri
  filter                 = var.log_sink_pubsub.filter
  log_sink_name          = var.log_sink_pubsub.name
  parent_resource_id     = var.org_id
  parent_resource_type   = "organization"
  unique_writer_identity = true
  include_children       = true
}

module "destination_pubsub" {
  source                   = "terraform-google-modules/log-export/google//modules/pubsub"
  project_id               = local.project_id
  topic_name               = var.log_sink_pubsub.topic_name
  log_sink_writer_identity = module.log_export_pubsub.writer_identity
  create_subscriber        = false
  kms_key_name             = one([for v in module.kms_logsink_pubsub.keys : v])
}

