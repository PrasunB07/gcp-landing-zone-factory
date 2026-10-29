# Hierarchy Policies Terraform Module

This module allows you to create the following resources:
1. Hierarchy Policies

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
| <a name="module_hierarchy_policies"></a> [hierarchy\_policies](#module\_hierarchy\_policies) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall_policies_hierarchy_factory | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_folder_name"></a> [anchor\_folder\_name](#input\_anchor\_folder\_name) | Anchor Folder ID | `string` | n/a | yes |
| <a name="input_firewall_dir"></a> [firewall\_dir](#input\_firewall\_dir) | Hierarchy Firewall rules path | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hierarchy_policies"></a> [hierarchy\_policies](#output\_hierarchy\_policies) | Hierarchy Policy Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
