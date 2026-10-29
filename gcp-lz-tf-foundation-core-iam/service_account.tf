module "service_accounts" {
  source           = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/service_account_factory//modules/service_account?ref=dev"
  for_each         = local.service_accounts_maps
  project_id       = var.project_id
  folder_id        = var.folder_id
  organization_id  = var.org_id
  service_accounts = each.value.service_accounts
}

