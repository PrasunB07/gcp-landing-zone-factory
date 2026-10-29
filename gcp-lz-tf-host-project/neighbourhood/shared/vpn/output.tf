output "gateway" {
  description = "HA VPN gateway resource."
  value       = module.vpn.gateway
}

output "external_gateway" {
  description = "External VPN gateway resource."
  value       = module.vpn.external_gateway
}

output "name" {
  description = "VPN gateway name."
  value       = module.vpn.name
}

output "router" {
  description = "Router resource (only if auto-created)."
  value       = module.vpn.router
}

output "router_name" {
  description = "Router name."
  value       = module.vpn.router_name
}

output "self_link" {
  description = "HA VPN gateway self link."
  value       = module.vpn.self_link
}

output "tunnels" {
  description = "VPN tunnel resources."
  sensitive   = true
  value       = module.vpn.tunnels
}

output "tunnel_names" {
  description = "VPN tunnel names."
  sensitive   = true
  value       = module.vpn.tunnel_names
}

output "tunnel_self_links" {
  description = "VPN tunnel self links."
  sensitive   = true
  value       = module.vpn.tunnel_self_links
}

output "random_secret" {
  description = "Generated secret."
  sensitive   = true
  value       = module.vpn.random_secret
}