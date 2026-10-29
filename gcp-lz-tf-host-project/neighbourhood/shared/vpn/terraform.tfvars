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