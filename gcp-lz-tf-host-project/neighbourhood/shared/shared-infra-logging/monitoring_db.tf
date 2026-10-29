module "monitoring_dashboard" {
  source                 = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_dashboard_factory?ref=dev"
  dashboard_config_files = var.dashboard_config_files
  project_id             = local.project_id
}