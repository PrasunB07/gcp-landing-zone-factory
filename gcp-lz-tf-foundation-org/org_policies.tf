module "org_policies" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/org_policy_factory?ref=dev"

  org_policies_data_path = local.org_policy_dir
  parent                 = "organizations/${var.org_id}"
}

