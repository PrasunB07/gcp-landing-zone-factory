module "tags" {
  source  = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/tag_factory?ref=dev"
  tag_dir = local.tag_dir
}

