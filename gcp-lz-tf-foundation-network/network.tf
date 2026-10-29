locals {
  foundation_vpc_project_id = data.terraform_remote_state.org_foundation.outputs.projects_factories.project-factory["shared-infra-logging"].project_id
}
module "vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "~> 7.0"

  project_id                             = local.foundation_vpc_project_id
  network_name                           = var.network_name
  routing_mode                           = "GLOBAL"
  delete_default_internet_gateway_routes = true
  auto_create_subnetworks                = false

}


module "subnets" {
  source              = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/subnet-factory?ref=dev"
  subnet_config_yamls = local.subnet_config_yamls
  network_name        = module.vpc.network_name
  depends_on = [
    module.vpc
  ]

}
