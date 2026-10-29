locals {
  project_id          = module.projects_factories.core_project[one(keys(module.projects_factories.core_project))].project_id
  project_number      = module.projects_factories.core_project[one(keys(module.projects_factories.core_project))].project_number
  projects_list       = data.google_projects.my-org-projects
  projects_map_byname = [for v in local.projects_list.projects : v.project_id]
}

