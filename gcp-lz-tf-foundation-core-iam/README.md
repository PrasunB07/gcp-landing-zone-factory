# Core IAM Terraform Module

This module allows you to create the following resources:
1. Service Accounts
2. Workload Identity Providers

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
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.61.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/service_account_factory//modules/service_account | dev |
| <a name="module_workload_identity_provider"></a> [workload\_identity\_provider](#module\_workload\_identity\_provider) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/workload_identity_provider_factory//modules/workload_identity_provider | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | Project Number | `string` | n/a | yes |
| <a name="input_yamlconfig_dir"></a> [yamlconfig\_dir](#input\_yamlconfig\_dir) | YAML directory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | Folder ID |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Organization ID |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project ID |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | Service Account Details |
| <a name="output_workload_identity_provider"></a> [workload\_identity\_provider](#output\_workload\_identity\_provider) | Workload Identity Provider Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
