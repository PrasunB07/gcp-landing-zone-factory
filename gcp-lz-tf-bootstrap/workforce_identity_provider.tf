resource "google_iam_workforce_pool" "pool" {
  workforce_pool_id = var.workforce_pool_id
  parent            = "organizations/${var.org_id}"
  location          = var.location
  display_name      = var.display_name
  description       = var.description
  disabled          = var.disabled
  session_duration  = var.session_duration
}

resource "google_iam_workforce_pool_provider" "provider" {
  for_each          = { for i in var.wif_providers : i.provider_id => i }
  workforce_pool_id = google_iam_workforce_pool.pool.workforce_pool_id
  location          = google_iam_workforce_pool.pool.location
  provider_id       = each.value.provider_id
  attribute_mapping = lookup(each.value, "attribute_mapping", null) == null ? null : each.value.attribute_mapping

  dynamic "saml" {
    for_each = lookup(each.value, "select_provider", null) == "saml" ? ["1"] : []
    content {
      idp_metadata_xml = each.value.provider_config.idp_metadata_xml
    }
  }

  dynamic "oidc" {
    for_each = lookup(each.value, "select_provider", null) == "oidc" ? ["1"] : []
    content {
      issuer_uri = each.value.provider_config.issuer_uri
      client_id  = each.value.provider_config.client_id
    }
  }

  display_name        = lookup(each.value, "display_name", null)
  description         = lookup(each.value, "description", null)
  disabled            = lookup(each.value, "disabled", false)
  attribute_condition = lookup(each.value, "attribute_condition", null)
}
