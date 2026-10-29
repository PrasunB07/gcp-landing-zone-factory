org_id                    = "514041104475"
anchor_name               = "desktop-anchor-folder"
project_config_yamls      = "./sample-data/project/config"
project_organization_yaml = "./sample-data/project/organization.yaml"
billing_account           = "01C49A-621DC9-A19CC4"
# notification_channel_factory_files = "./sample-data/notification_channels"
# budget_alert_config_yamls          = "./sample-data/budget_alert"
dashboard_config_files      = "./sample-data/monitoring_db"
monitoring_alert_config_dir = "./sample-data/monitoring_alert"

log_sink_bucket = {
  bucket_name                      = "shared-infra-logging-log-sink-bucket2"
  bucket_location                  = "us-central1"
  lifecycle_rule_delete_age        = 365
  lifecycle_rule_storage_class     = "REGIONAL"
  lifecycle_rule_storage_class_age = 180
  name                             = "shared-infra-logging-log-sink2"
  topic_name                       = "shared-infra-logging-log-sink-topic2"
  key_ring_name                    = "shared-infra-logging-keyring"
  key_location                     = "us-central1"
  encryption_keys                  = ["bucket-key"]
  filter                           = "severity >= ERROR"
}

log_sink_pubsub = {
  name            = "shared-infra-logging-pubsub-log-sink2"
  topic_name      = "shared-infra-logging-log-sink-topic2"
  key_ring_name   = "shared-infra-logging-pubsub-keyring"
  key_location    = "us-central1"
  encryption_keys = ["pubsub-key"]
  filter          = "severity >= ERROR"
  sa_account_id   = "logsinkpubsub-service-account2"
  sa_display_name = "logsink_pubsub_service_account2"
}