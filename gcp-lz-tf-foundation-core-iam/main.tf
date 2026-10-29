locals {
  bootstrap_config_yaml = var.yamlconfig_dir
  service_accounts_maps = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    var.project_id => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).service_account_details
    if can(yamldecode(file("${local.bootstrap_config_yaml}/${f}")).service_account_details)
  }
  workload_identity_provider_maps = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    var.project_id => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).workload_identity_provider_details
    if can(yamldecode(file("${local.bootstrap_config_yaml}/${f}")).workload_identity_provider_details)
  }
}

# output "test2" {
#   value = local.workload_identity_provider_maps
# }