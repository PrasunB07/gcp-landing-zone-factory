output "vpc" {
  value = module.vpc
}
output "subnets" {
  value = module.subnets.subnets
}
