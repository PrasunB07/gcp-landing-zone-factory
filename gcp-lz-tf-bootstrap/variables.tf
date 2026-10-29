
variable "yamlconfig_dir" {
  description = "YAML directory."
  type        = string
}

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "folder_id" {
  description = "The ID of a folder to host this project"
  type        = string
}

variable "kms" {
  description = "Log Sink Properties"
  type = object(
    {
      key_location    = string
      key_ring_name   = string
      encryption_keys = list(string)
    }
  )
}

variable "bucket" {
  description = "Bucket Properties"
  type = object(
    {
      name                       = string
      region                     = string
      force_destroy              = string
      encrypt_gcs_bucket_tfstate = bool
    }
  )
}

variable "workforce_pool_id" {
  type        = string
  description = "Workforce Pool ID"
}

variable "location" {
  type        = string
  description = "Location of the Pool"
}

variable "display_name" {
  type        = string
  default     = null
  description = "Display name of the Pool"
}

variable "description" {
  type        = string
  default     = null
  description = "Description of the Pool"
}

variable "disabled" {
  type        = bool
  default     = false
  description = "Enable the Pool"
}

variable "session_duration" {
  type        = string
  default     = "3600s"
  description = "Session Duration"
}

variable "wif_providers" {
  type        = list(any)
  description = "Provider config"
}