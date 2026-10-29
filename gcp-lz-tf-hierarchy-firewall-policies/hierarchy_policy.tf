module "hierarchy_policies" {
  source             = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall_policies_hierarchy_factory?ref=dev"
  firewall_dir       = var.firewall_dir
  org_id             = var.org_id
  anchor_folder_name = var.anchor_folder_name
}


