module "vpn" {
  source                = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/vpn?ref=dev"
  project_id            = var.project_id
  region                = var.region
  network               = var.network
  name                  = var.name
  peer_external_gateway = var.peer_external_gateway
  router_asn            = var.router_asn
  tunnels               = var.tunnels
}