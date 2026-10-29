variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "project_number" {
  description = "Project Number"
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

variable "yamlconfig_dir" {
  description = "YAML directory."
  type        = string
}