locals {
  project_number = module.projects_factories.core_project[one(keys(module.projects_factories.core_project))].project_number
}
