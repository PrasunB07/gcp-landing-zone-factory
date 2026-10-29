org_id         = "514041104475"
folder_id      = "gcplz-bootstrap-folder2"
yamlconfig_dir = "./sample-data/"

kms = {
  key_location    = "us-central1"
  key_ring_name   = "terraform-state"
  encryption_keys = ["bucket-terraform-state-key"]
}

bucket = {
  name                       = "cg-terraform-state-bucket222"
  region                     = "us-central1"
  force_destroy              = false
  encrypt_gcs_bucket_tfstate = true
}

workforce_pool_id = "workforce-test-pool"
location          = "global"
display_name      = "workforce-test-pool"
description       = "OIDC workforce pool"
disabled          = "false"
session_duration  = "60m"

wif_providers = [
  {
    provider_id     = "provider-2"
    select_provider = "oidc"
    provider_config = {
      issuer_uri                        = "https://accounts.google.com"
      client_id                         = "client-id"
      web_sso_response_type             = "ID_TOKEN"             #optional
      web_sso_assertion_claims_behavior = "ONLY_ID_TOKEN_CLAIMS" #optional
    }
  }
]