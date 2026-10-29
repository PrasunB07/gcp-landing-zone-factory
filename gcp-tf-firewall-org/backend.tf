terraform {
  cloud {
    organization = "testgcplz"

    workspaces {
      name = "gcp-lz-tf-firewall"
    }
  }
}