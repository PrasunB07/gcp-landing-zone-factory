variable "project_config_yamls" {
  type        = string
  description = "Project directory where YAML files are stored"
}

variable "project_organization_yaml" {
  type        = string
  description = "Project organization directory where YAML files are stored"
}

variable "org_id" {
  description = "Organization ID."
  type        = string
}

variable "anchor_name" {
  description = "Anchor folder name."
  type        = string
}

variable "billing_account" {
  description = "Billing account ID."
  type        = string
}
