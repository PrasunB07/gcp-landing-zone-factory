# Bootstrap Terraform Module

This module is used to create the following resources:
1. Bootstrap Folder
2. Bootstrap Project
3. Bootstrap(root) Service Account
4. **Optional** GCS Bucket for State Management with KMS
5. Workload Identity Pool and Provider
6. Workforce Identity Pool and Provider

## Pre-Requisties
1. Create a manual seed project using Google Cloud Console  
2. Create a Service Account with the following permissions  
>> - Project Creator  
>> -  Service Account Admin  
>> -  Workload Identity Pool Admin  
>> -  Workload Identity User
>> -  Organization Admin  
>
3. Create Workload Identity Pool and provider and attach Service Account to the Workload Identity Pool  
>> - Configure Attribute mapping depending on the services being used with the Workload Provider (ie.github, Terraform Cloud)
>> - For security configure the provider features such as Allowed Audience, Attribute Condition  
>
4. (OPTIONAL): Create GCS bucket depending on state file management with KMS protection  

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

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bootstrap"></a> [bootstrap](#module\_bootstrap) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project_factory/core_project_factory//modules/project | dev |
| <a name="module_kms_state_bucket"></a> [kms\_state\_bucket](#module\_kms\_state\_bucket) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/kms | dev |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/service_account_factory//modules/service_account | dev |
| <a name="module_workload_identity_provider"></a> [workload\_identity\_provider](#module\_workload\_identity\_provider) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/workload_identity_provider_factory//modules/workload_identity_provider | dev |

## Resources

| Name | Type |
|------|------|
| [google_folder.bootstrap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_iam_workforce_pool.pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool) | resource |
| [google_iam_workforce_pool_provider.provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool_provider) | resource |
| [google_storage_bucket.org_terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_project_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Bucket Properties | <pre>object(<br>    {<br>      name                       = string<br>      region                     = string<br>      force_destroy              = string<br>      encrypt_gcs_bucket_tfstate = bool<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the Pool | `string` | `null` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | Enable the Pool | `bool` | `false` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of the Pool | `string` | `null` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | n/a | yes |
| <a name="input_kms"></a> [kms](#input\_kms) | Log Sink Properties | <pre>object(<br>    {<br>      key_location    = string<br>      key_ring_name   = string<br>      encryption_keys = list(string)<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the Pool | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_session_duration"></a> [session\_duration](#input\_session\_duration) | Session Duration | `string` | `"3600s"` | no |
| <a name="input_wif_providers"></a> [wif\_providers](#input\_wif\_providers) | Provider config | `list(any)` | n/a | yes |
| <a name="input_workforce_pool_id"></a> [workforce\_pool\_id](#input\_workforce\_pool\_id) | Workforce Pool ID | `string` | n/a | yes |
| <a name="input_yamlconfig_dir"></a> [yamlconfig\_dir](#input\_yamlconfig\_dir) | YAML directory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_folder"></a> [google\_folder](#output\_google\_folder) | Bootstrap Folder Details |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Organization ID |
| <a name="output_seed_bootstrap"></a> [seed\_bootstrap](#output\_seed\_bootstrap) | Bootstrap Project Details |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | Service Account Details |
| <a name="output_workforce_pool"></a> [workforce\_pool](#output\_workforce\_pool) | Workforce Pool Details |
| <a name="output_workforce_provider"></a> [workforce\_provider](#output\_workforce\_provider) | Workforce Provider Details |
| <a name="output_workload_identity_provider"></a> [workload\_identity\_provider](#output\_workload\_identity\_provider) | Workload Identity Provider Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
