# Project Factory Module

This module is used to create the following resources:
1. Host or Service Project
2. API Activation
3. Shared VPC
4. VPC peering
5. Service Account (NOTE: Default Service Account is deleted by default)

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
| <a name="module_projects_factories"></a> [projects\_factories](#module\_projects\_factories) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project_factory | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anchor_name"></a> [anchor\_name](#input\_anchor\_name) | Anchor folder name. | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account ID. | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID. | `string` | n/a | yes |
| <a name="input_project_config_yamls"></a> [project\_config\_yamls](#input\_project\_config\_yamls) | Project directory where YAML files are stored | `string` | n/a | yes |
| <a name="input_project_organization_yaml"></a> [project\_organization\_yaml](#input\_project\_organization\_yaml) | Project organization directory where YAML files are stored | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | Project Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
