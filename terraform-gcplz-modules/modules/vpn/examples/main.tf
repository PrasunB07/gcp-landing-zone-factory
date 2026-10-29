module "vpn" {
  source     = "../"
  project_id = "vpn_project"
  region     = "europe-west4"
  network    = "https://www.googleapis.com/compute/v1/projects/vpn_project/global/networks/my-network"
  name       = "mynet-to-onprem"
  peer_external_gateway = {
    redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
    interfaces = [{
      id         = 0
      ip_address = "8.8.8.8" # on-prem router ip address
    }]
  }
  router_asn = 64514
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = "mySecret"
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = 0
      shared_secret                   = "mySecret"
    }
  }
}

output "vpn" {
  value     = module.vpn
  sensitive = true
}

#GCP to GCP example

# module "vpn_ha-1" {
#   source  = "terraform-google-modules/vpn/google//modules/vpn_ha"
#   version = "~> 1.3.0"
#   project_id  = "<PROJECT_ID>"
#   region  = "europe-west4"
#   network         = "https://www.googleapis.com/compute/v1/projects/<PROJECT_ID>/global/networks/network-1"
#   name            = "net1-to-net-2"
#   peer_gcp_gateway = module.vpn_ha-2.self_link
#   router_asn = 64514
#   tunnels = {
#     remote-0 = {
#       bgp_peer = {
#         address = "169.254.1.1"
#         asn     = 64513
#       }
#       bgp_peer_options  = null
#       bgp_session_range = "169.254.1.2/30"
#       ike_version       = 2
#       vpn_gateway_interface = 0
#       peer_external_gateway_interface = null
#       shared_secret     = ""
#     }
#     remote-1 = {
#       bgp_peer = {
#         address = "169.254.2.1"
#         asn     = 64513
#       }
#       bgp_peer_options  = null
#       bgp_session_range = "169.254.2.2/30"
#       ike_version       = 2
#       vpn_gateway_interface = 1
#       peer_external_gateway_interface = null
#       shared_secret     = ""
#     }
#   }
# }

# module "vpn_ha-2" {
#   source  = "terraform-google-modules/vpn/google//modules/vpn_ha"
#   version = "~> 1.3.0"
#   project_id  = "<PROJECT_ID>"
#   region  = "europe-west4"
#   network         = "https://www.googleapis.com/compute/v1/projects/<PROJECT_ID>/global/networks/local-network"
#   name            = "net2-to-net1"
#   router_asn = 64513
#   peer_gcp_gateway = module.vpn_ha-1.self_link
#   tunnels = {
#     remote-0 = {
#       bgp_peer = {
#         address = "169.254.1.2"
#         asn     = 64514
#       }
#       bgp_peer_options  = null
#       bgp_session_range = "169.254.1.1/30"
#       ike_version       = 2
#       vpn_gateway_interface = 0
#       peer_external_gateway_interface = null
#       shared_secret     = module.vpn_ha-1.random_secret
#     }
#     remote-1 = {
#       bgp_peer = {
#         address = "169.254.2.2"
#         asn     = 64514
#       }
#       bgp_peer_options  = null
#       bgp_session_range = "169.254.2.1/30"
#       ike_version       = 2
#       vpn_gateway_interface = 1
#       peer_external_gateway_interface = null
#       shared_secret     = module.vpn_ha-1.random_secret
#     }
#   }
# }