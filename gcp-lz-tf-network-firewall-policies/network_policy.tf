module "network_policies" {
  source       = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall_policies_network_factory?ref=dev"
  firewall_dir = var.firewall_dir
}


