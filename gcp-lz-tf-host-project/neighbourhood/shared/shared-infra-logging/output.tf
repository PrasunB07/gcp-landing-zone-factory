output "projects" {
  description = "Project Details"
  value       = module.projects_factories
}

output "kms_logsink" {
  description = "GCS Bucket KMS Key"
  value       = module.kms_logsink
}

output "destination_bucket" {
  description = "GCS logging Details"
  value       = module.destination_bucket
}

output "kms_logsink_pubsub" {
  description = "PubSub KMS Key"
  value       = module.kms_logsink_pubsub
}

output "destination_pubsub" {
  description = "PubSub logging Details"
  value       = module.destination_pubsub
}