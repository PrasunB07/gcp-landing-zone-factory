
module "anchor_folder" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/folder_factory//modules/folder?ref=dev"
  parent = "organizations/${var.org_id}"

  names = [
    "${local.anchor_config.name}"
  ]

  depends_on = [
    module.org_policies
  ]

}

module "neighbourhood_folders" {
  source   = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/folder_factory//modules/folder?ref=dev"
  for_each = local.neighbourhood_configs
  parent   = module.anchor_folder.id

  names = [
    "${try(each.value.name, null)}"
  ]

  depends_on = [
    module.org_policies
  ]

}
module "neighbourhood_folders_policies" {
  source                 = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/org_policy_factory?ref=dev"
  for_each               = local.neighbourhood_config_files
  org_policies_file_path = each.value
  parent                 = module.neighbourhood_folders[each.key].id
}



