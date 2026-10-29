locals {
  org_id         = "514041104475"
  folder_id      = ""
  project_detail = yamldecode(file("./sample-data/project-a.yaml"))
  wip_detail     = yamldecode(file("./sample-data/wip-a.yaml"))
}

output "project" {
  value = local.project_detail
}

# resource "google_folder" "bootstrap" {
#   display_name = local.folder_id
#   parent       = "organizations/${local.org_id}"
# }

module "bootstrap" {
  source            = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project-factory/core_project_factory//modules/project?ref=dev"
  for_each          = local.project_detail
  org_id            = local.org_id
  name              = each.value.name
  billing_account   = each.value.billing_account
  activate_apis     = each.value.activate_apis
  lien              = each.value.lien
  create_project_sa = false
  # folder_id         = google_folder.bootstrap.name
}
output "bootstrap_out" {
  # value = module.bootstrap.project_details.project_number
  value = [for k, v in module.bootstrap : v.project_number].0
  # value = values(module.bootstrap.project_details.project_number)[0]
}

module "workload_identity_provider" {
  source                    = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/workload_identity_provider_factory//modules/workload_identity_provider?ref=dev"
  for_each                  = local.wip_detail
  workload_identity_pool_id = each.value.workload_identity_pool_id
  # project_id                 = try(local.project[each.key].name)
  project_id                 = [for k, v in module.bootstrap : v.project_id].0
  workload_identity_provider = each.value.workload_identity_provider
  project_number             = [for k, v in module.bootstrap : v.project_number].0

  depends_on = [
    # module.service_accounts,
    module.bootstrap
  ]
}


