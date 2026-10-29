module "service_accounts" {
  source           = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/service_account_factory//modules/service_account?ref=dev"
  for_each         = local.service_accounts_maps
  project_id       = module.bootstrap[local.bootstrap_project].project_id
  folder_id        = google_folder.bootstrap.name
  organization_id  = var.org_id
  service_accounts = each.value.service_accounts
  depends_on = [
    module.bootstrap
  ]
}

