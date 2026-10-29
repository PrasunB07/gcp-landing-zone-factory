## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.61.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.61.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall_rules"></a> [firewall\_rules](#module\_firewall\_rules) | git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/firewall-rules-factory | dev |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_dir"></a> [firewall\_dir](#input\_firewall\_dir) | Firewall rules path | `string` | n/a | yes |

## Outputs

No outputs.
