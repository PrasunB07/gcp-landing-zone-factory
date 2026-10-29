module "projects_factories" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project_factory?ref=dev"

  org_id               = var.org_id
  billing_account      = var.billing_account
  organization_yaml    = var.project_organization_yaml
  project_config_yamls = var.project_config_yamls
  anchor_folder_name   = var.anchor_name
}
