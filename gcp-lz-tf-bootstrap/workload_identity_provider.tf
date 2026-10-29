module "workload_identity_provider" {
  source                     = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/workload_identity_provider_factory//modules/workload_identity_provider?ref=dev"
  for_each                   = local.workload_identity_provider_maps
  workload_identity_pool_id  = each.value.workload_identity_pool_id
  project_id                 = module.bootstrap[local.bootstrap_project].project_id
  workload_identity_provider = each.value.workload_identity_provider
  project_number             = module.bootstrap[local.bootstrap_project].project_number

  depends_on = [
    module.service_accounts,
    module.bootstrap
  ]
}
