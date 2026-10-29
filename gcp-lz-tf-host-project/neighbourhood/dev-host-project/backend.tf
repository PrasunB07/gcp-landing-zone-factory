terraform {
  cloud {
    organization = "testgcplz"

    workspaces {
      name = "dev-gcp-lz-tf-host-dev-amber"
    }
  }
}