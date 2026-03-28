# Google SQL Database Instance
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/sql_database_instance

resource "google_sql_database_instance" "this" {
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  name                = local.name
  project             = var.project
  region              = var.region

  settings {
    availability_type = var.availability_type
    edition           = "ENTERPRISE"
    tier              = var.machine_tier

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
      start_time                     = var.backup_start_time
    }

    dynamic "database_flags" {
      for_each = local.database_flags
      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    insights_config {
      query_insights_enabled  = var.query_insights_enabled
      query_plans_per_minute  = var.query_plans_per_minute
      query_string_length     = var.query_string_length
      record_application_tags = var.record_application_tags
      record_client_address   = var.record_client_address
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = local.network
      ssl_mode        = "ENCRYPTED_ONLY"
    }

    maintenance_window {
      day          = var.mw_day
      hour         = var.mw_hour
      update_track = var.update_track
    }

    user_labels = var.labels
  }
}

# Google SQL SSL Certificate Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/sql_ssl_cert

resource "google_sql_ssl_cert" "this" {
  for_each = var.client_certs

  common_name = each.key
  instance    = google_sql_database_instance.this.name
  project     = var.project
}

# Random ID Resource
# https://search.opentofu.org/provider/hashicorp/random/latest/docs/resources/id

resource "random_id" "this" {
  byte_length = "1"
  prefix      = "tf"
}
