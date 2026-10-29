# Organization Foundation Terraform Module

This module allows you to create the following resources:
1. Neighbourhood Folders
2. Organization Policies at Org and Folder level
3. Secure Tag Key and Values

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
| <a name="module_anchor_folder"></a> [anchor\_folder](#module\_anchor\_folder) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/folder_factory//modules/folder | dev |
| <a name="module_neighbourhood_folders"></a> [neighbourhood\_folders](#module\_neighbourhood\_folders) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/folder_factory//modules/folder | dev |
| <a name="module_neighbourhood_folders_policies"></a> [neighbourhood\_folders\_policies](#module\_neighbourhood\_folders\_policies) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/org_policy_factory | dev |
| <a name="module_org_policies"></a> [org\_policies](#module\_org\_policies) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/org_policy_factory | dev |
| <a name="module_tags"></a> [tags](#module\_tags) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/tag_factory | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_dir"></a> [config\_dir](#input\_config\_dir) | configuration directory where YAML files are stored | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_anchor_folder_id"></a> [anchor\_folder\_id](#output\_anchor\_folder\_id) | Anchor Folder ID |
| <a name="output_anchor_folder_name"></a> [anchor\_folder\_name](#output\_anchor\_folder\_name) | Anchor Folder Name |
| <a name="output_neighbourhood_folders_map"></a> [neighbourhood\_folders\_map](#output\_neighbourhood\_folders\_map) | Output values of folder display name, folder ID, folder name, and folder parent |
| <a name="output_tags"></a> [tags](#output\_tags) | Secure Tag Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->