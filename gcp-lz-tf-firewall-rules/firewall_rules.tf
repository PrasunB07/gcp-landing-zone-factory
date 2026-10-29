module "firewall_rules" {
  source       = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall_rules_factory?ref=dev"
  firewall_dir = var.firewall_dir
}


