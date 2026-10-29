resource "google_folder" "bootstrap" {
  display_name = var.folder_id
  parent       = "organizations/${var.org_id}"
}

module "bootstrap" {
  source            = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/project_factory/core_project_factory//modules/project?ref=dev"
  for_each          = local.project
  org_id            = var.org_id
  name              = each.value.name
  billing_account   = each.value.billing_account
  activate_apis     = each.value.activate_apis
  lien              = each.value.lien
  create_project_sa = false
  folder_id         = google_folder.bootstrap.name
}
