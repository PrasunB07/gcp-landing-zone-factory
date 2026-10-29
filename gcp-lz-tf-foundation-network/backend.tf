
terraform {
  cloud {
    organization = "testgcplz"

    workspaces {
      name = "gcp-lz-tf-foundation-net"
    }
  }
}

####### REMOTE STATES ########
data "terraform_remote_state" "org_foundation" {
  backend = "remote"
  config = {
    organization = "testgcplz"
    workspaces = {
      name = "gcp-lz-tf-foundation-org"
    }
  }

}

# output "terraform_remote_state__org_foundation" {
#   value = data.terraform_remote_state.org_foundation
# }
