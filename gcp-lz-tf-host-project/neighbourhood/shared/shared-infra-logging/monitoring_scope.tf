data "google_projects" "my-org-projects" {
  filter = "parent.type:folder lifecycleState:ACTIVE NOT id:${local.project_id}"
}

module "monitoring_scope" {
  source = "git::https://github.com/gcp-coe/terraform-gcplz-modules.git//modules/monitoring_scope_factory//modules/monitoring_scope?ref=dev"
  monitored_projects = {
    for v in local.projects_map_byname : v => {
    }
  }
  metrics_scope_project_id = local.project_id
}


