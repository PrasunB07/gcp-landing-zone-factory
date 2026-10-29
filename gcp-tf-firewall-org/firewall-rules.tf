module "firewall_rules" {
  source       = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall-rules-factory?ref=dev"
  firewall_dir = local.firewall_dir
}