
locals {
  bootstrap_config_yaml = var.yamlconfig_dir
  project = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    yamldecode(file("${local.bootstrap_config_yaml}/${f}")).project_details.name => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).project_details
  }

  service_accounts_maps = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    yamldecode(file("${local.bootstrap_config_yaml}/${f}")).project_details.name => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).service_account_details
    if can(yamldecode(file("${local.bootstrap_config_yaml}/${f}")).service_account_details)
  }
  workload_identity_provider_maps = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    yamldecode(file("${local.bootstrap_config_yaml}/${f}")).project_details.name => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).workload_identity_provider_details
    if can(yamldecode(file("${local.bootstrap_config_yaml}/${f}")).workload_identity_provider_details)
  }
  tag_maps = {
    for f in fileset("${local.bootstrap_config_yaml}", "**/*.yaml") :
    yamldecode(file("${local.bootstrap_config_yaml}/${f}")).project_details.name => yamldecode(file("${local.bootstrap_config_yaml}/${f}")).tag
    if can(yamldecode(file("${local.bootstrap_config_yaml}/${f}")).tag)
  }
  bootstrap_project = one([for k, v in local.project : v.name])
  sa_name           = one(keys(local.service_accounts_maps[local.bootstrap_project].service_accounts))
}

# output "test2" {
#   value = local.test2
# }
