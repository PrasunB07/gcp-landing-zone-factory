# Project Factory Module

This module is used to create the following resources:
1. Host or Service Project
2. API Activation
3. Shared VPC
4. VPC peering
5. Service Account (NOTE: Default Service Account is deleted by default)
6. Monitoring Alerts
7. Monitoring Scope (Note: This will call upon a data block to add all projects to logging)
8. Monitoring Dashboards
9. GCS Logsink Creation with KMS protection
10. Pub/Sub Logsink with KMS protection

## Where should I store my Terraform state?

Terraform state be stored on Google Cloud Storage or Terraform Cloud.

```hcl
terraform {
  backend "gcs" {
    bucket  = "tf-state-projects"
    prefix  = "terraform/state/team1"
  }
}

terraform {
  cloud {
    organization = "tf-org"
    workspaces {
      name = "tf-workspace"
    }
  }
}

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.68.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.68.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_destination_bucket"></a> [destination\_bucket](#module\_destination\_bucket) | terraform-google-modules/log-export/google//modules/storage | ~> 7.0 |
| <a name="module_destination_pubsub"></a> [destination\_pubsub](#module\_destination\_pubsub) | terraform-google-modules/log-export/google//modules/pubsub | n/a |
| <a name="module_kms_logsink"></a> [kms\_logsink](#module\_kms\_logsink) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms | dev |
| <a name="module_kms_logsink_pubsub"></a> [kms\_logsink\_pubsub](#module\_kms\_logsink\_pubsub) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms | dev |
| <a name="module_log_export_bucket"></a> [log\_export\_bucket](#module\_log\_export\_bucket) | terraform-google-modules/log-export/google | ~> 7.0 |
| <a name="module_log_export_pubsub"></a> [log\_export\_pubsub](#module\_log\_export\_pubsub) | terraform-google-modules/log-export/google | ~> 7.0 |
| <a name="module_monitoring_alert"></a> [monitoring\_alert](#module\_monitoring\_alert) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_alert_factory | dev |
| <a name="module_monitoring_dashboard"></a> [monitoring\_dashboard](#module\_monitoring\_dashboard) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_dashboard_factory | dev |
| <a name="module_monitoring_scope"></a> [monitoring\_scope](#module\_monitoring\_scope) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_scope_factory//modules/monitoring_scope | dev |
| <a name="module_projects_factories"></a> [projects\_factories](#module\_projects\_factories) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project_factory | dev |

## Resources

| Name | Type |
|------|------|
| [google_projects.my-org-projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_storage_project_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_name"></a> [anchor\_name](#input\_anchor\_name) | Anchor folder name. | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account ID. | `string` | n/a | yes |
| <a name="input_dashboard_config_files"></a> [dashboard\_config\_files](#input\_dashboard\_config\_files) | monitoring dashboard config yaml files | `string` | n/a | yes |
| <a name="input_log_sink_bucket"></a> [log\_sink\_bucket](#input\_log\_sink\_bucket) | Log Sink Properties | <pre>object(<br>    {<br>      name                             = string<br>      bucket_name                      = string<br>      bucket_location                  = string<br>      lifecycle_rule_storage_class     = string<br>      lifecycle_rule_storage_class_age = string<br>      lifecycle_rule_delete_age        = number<br>      topic_name                       = string<br>      key_ring_name                    = string<br>      key_location                     = string<br>      encryption_keys                  = list(string)<br>      filter                           = string<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_log_sink_pubsub"></a> [log\_sink\_pubsub](#input\_log\_sink\_pubsub) | Pubsub Log Sink Properties | <pre>object(<br>    {<br>      name            = string<br>      topic_name      = string<br>      key_ring_name   = string<br>      key_location    = string<br>      encryption_keys = list(string)<br>      filter          = string<br>      sa_account_id   = string<br>      sa_display_name = string<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_monitoring_alert_config_dir"></a> [monitoring\_alert\_config\_dir](#input\_monitoring\_alert\_config\_dir) | monitoring alert config yaml files | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID. | `string` | n/a | yes |
| <a name="input_project_config_yamls"></a> [project\_config\_yamls](#input\_project\_config\_yamls) | Project directory where YAML files are stored | `string` | n/a | yes |
| <a name="input_project_organization_yaml"></a> [project\_organization\_yaml](#input\_project\_organization\_yaml) | Project organization directory where YAML files are stored | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_destination_bucket"></a> [destination\_bucket](#output\_destination\_bucket) | GCS logging Details |
| <a name="output_destination_pubsub"></a> [destination\_pubsub](#output\_destination\_pubsub) | PubSub logging Details |
| <a name="output_kms_logsink"></a> [kms\_logsink](#output\_kms\_logsink) | GCS Bucket KMS Key |
| <a name="output_kms_logsink_pubsub"></a> [kms\_logsink\_pubsub](#output\_kms\_logsink\_pubsub) | PubSub KMS Key |
| <a name="output_projects"></a> [projects](#output\_projects) | Project Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
