output "neighbourhood_folders_map" {
  description = "Output values of folder display name, folder ID, folder name, and folder parent"
  value = {
    for k, v in module.neighbourhood_folders : v.folder.display_name => {
      folder_id = v.folder.folder_id
      name      = v.folder.name
      parent    = v.folder.parent
    }
  }
}

output "anchor_folder_name" {
  description = "Anchor Folder Name"
  value       = module.anchor_folder.folder.display_name
}

output "anchor_folder_id" {
  description = "Anchor Folder ID"
  value       = module.anchor_folder.folder.id
}

output "tags" {
  description = "Secure Tag Details"
  value       = module.tags
}
