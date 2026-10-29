output "org_id" {
  description = "Organization ID"
  value       = var.org_id
}

output "seed_bootstrap" {
  description = "Bootstrap Project Details"
  value       = module.bootstrap
}

output "google_folder" {
  description = "Bootstrap Folder Details"
  value       = resource.google_folder.bootstrap
}

output "workload_identity_provider" {
  description = "Workload Identity Provider Details"
  value       = module.workload_identity_provider
}

output "service_accounts" {
  description = "Service Account Details"
  value       = module.service_accounts
}

output "workforce_pool" {
  description = "Workforce Pool Details"
  value       = resource.google_iam_workforce_pool.pool
}

output "workforce_provider" {
  description = "Workforce Provider Details"
  value       = resource.google_iam_workforce_pool_provider.provider
}

