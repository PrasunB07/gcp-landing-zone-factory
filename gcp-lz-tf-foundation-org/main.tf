locals {
  base_dir                        = path.module
  anchor_folder_config_file       = "${local.base_dir}/${var.config_dir}/folders/anchor.yaml"
  anchor_config                   = yamldecode(file("${local.anchor_folder_config_file}"))
  tag_dir                         = "${local.base_dir}/${var.config_dir}/tags"
  org_policy_dir                  = "${local.base_dir}/${var.config_dir}/orgpolicies"
  neighbourhood_folder_config_dir = "${local.base_dir}/${var.config_dir}/folders/neighbourhood/"
  neighbourhood_configs = {
    for f in fileset("${local.neighbourhood_folder_config_dir}", "**/*.yaml") :
    trimsuffix(f, ".yaml") => yamldecode(file("${local.neighbourhood_folder_config_dir}/${f}"))
  }
  neighbourhood_config_files = {
    for f in fileset("${local.neighbourhood_folder_config_dir}", "**/*.yaml") :
    trimsuffix(f, ".yaml") => "${local.neighbourhood_folder_config_dir}${f}"
  }
}
