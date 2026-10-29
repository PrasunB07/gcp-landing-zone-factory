module "monitoring_alert" {
  source                      = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_alert_factory?ref=dev"
  monitoring_alert_config_dir = var.monitoring_alert_config_dir
  project_id                  = local.project_id
  depends_on = [
    module.monitoring_scope
  ]
}