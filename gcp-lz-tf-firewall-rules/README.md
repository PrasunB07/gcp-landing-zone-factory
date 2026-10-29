# Firewall Rules Terraform Module

This module allows you to create the following resources:
1. Firewall Rules

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
| <a name="module_firewall_rules"></a> [firewall\_rules](#module\_firewall\_rules) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall_rules_factory | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_dir"></a> [firewall\_dir](#input\_firewall\_dir) | Firewall Rules Path | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_rules"></a> [firewall\_rules](#output\_firewall\_rules) | Firewall Rules Details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
