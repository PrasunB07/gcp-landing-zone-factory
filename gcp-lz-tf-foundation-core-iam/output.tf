output "org_id" {
  description = "Organization ID"
  value       = var.org_id
}

output "project_id" {
  description = "Project ID"
  value       = var.project_id
}

output "folder_id" {
  description = "Folder ID"
  value       = var.folder_id
}

output "workload_identity_provider" {
  description = "Workload Identity Provider Details"
  value       = module.workload_identity_provider
}

output "service_accounts" {
  description = "Service Account Details"
  value       = module.service_accounts
}
