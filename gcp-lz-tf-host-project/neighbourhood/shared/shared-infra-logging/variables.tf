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

variable "dashboard_config_files" {
  description = "monitoring dashboard config yaml files"
  type        = string
}

variable "monitoring_alert_config_dir" {
  description = "monitoring alert config yaml files"
  type        = string
}

variable "log_sink_bucket" {
  description = "Log Sink Properties"
  type = object(
    {
      name                             = string
      bucket_name                      = string
      bucket_location                  = string
      lifecycle_rule_storage_class     = string
      lifecycle_rule_storage_class_age = string
      lifecycle_rule_delete_age        = number
      topic_name                       = string
      key_ring_name                    = string
      key_location                     = string
      encryption_keys                  = list(string)
      filter                           = string
    }
  )
}
variable "log_sink_pubsub" {
  description = "Pubsub Log Sink Properties"
  type = object(
    {
      name            = string
      topic_name      = string
      key_ring_name   = string
      key_location    = string
      encryption_keys = list(string)
      filter          = string
      sa_account_id   = string
      sa_display_name = string
    }
  )
}
