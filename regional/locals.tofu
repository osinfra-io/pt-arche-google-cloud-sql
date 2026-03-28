# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  database_flags = startswith(var.database_version, "POSTGRES_") ? local.postgres_database_flags : []

  name    = "${var.instance_name}-${random_id.this.hex}-${var.region}"
  network = "projects/${var.host_project_id}/global/networks/${var.network}"

  # These flags are required for CIS GCP v1.3.0 compliance

  postgres_database_flags = concat([
    {
      name  = "cloudsql.enable_pgaudit"
      value = "on"
    },
    {
      name  = "log_checkpoints"
      value = "on"
    },
    {
      name  = "log_connections"
      value = "on"
    },
    {
      name  = "log_disconnections"
      value = "on"
    },
    {
      name  = "log_hostname"
      value = "on"
    },
    {
      name  = "log_lock_waits"
      value = "on"
    },
    {
      name  = "log_min_error_statement"
      value = "error"
    },
    {
      name  = "log_min_duration_statement"
      value = "-1"
    },
    {
      name  = "log_min_messages"
      value = "error"
    },
    {
      name  = "log_statement"
      value = "ddl"
    }
  ], var.postgres_database_flags)
}
