terraform {
  cloud {
    organization = "testgcplz"

    workspaces {
      name = "dev-gcp-lz-tf-network-policies"
    }
  }
}