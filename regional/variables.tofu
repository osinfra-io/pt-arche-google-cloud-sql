# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "availability_type" {
  default     = "REGIONAL"
  description = "The availability type of the Cloud SQL instance"
  type        = string
}

variable "backup_start_time" {
  default     = "04:00"
  description = "Time indicating when backup configuration starts"
  type        = string
}

variable "client_certs" {
  default     = []
  description = "A set of client cert names, note: 10 max per instance"
  type        = set(string)
}

variable "database_version" {
  default     = "POSTGRES_16"
  description = "The MySQL, PostgreSQL or SQL Server version to use."
  type        = string
}

variable "deletion_protection" {
  default     = true
  description = "Whether or not to allow OpenTofu to destroy the instance"
  type        = bool
}

variable "host_project_id" {
  default     = ""
  description = "Host project ID for the shared VPC"
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "labels" {
  default     = {}
  description = "A map of key/value pairs to assign to the resources being created"
  type        = map(string)
}

variable "machine_tier" {
  default     = "db-f1-micro"
  description = "The machine type to use. Postgres supports only shared-core machine types, and custom machine types such as db-custom-2-13312"
  type        = string
}

variable "mw_day" {
  default     = 4
  description = "Maintenance window day"
  type        = number
}

variable "mw_hour" {
  default     = 17
  description = "Maintenance window hour"
  type        = number
}

variable "network" {
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP"
  type        = string
}

variable "point_in_time_recovery_enabled" {
  default     = false
  description = "True if Point-in-time recovery is enabled. Will restart database if enabled after instance creation. Valid only for PostgreSQL instances"
  type        = bool
}

variable "postgres_database_flags" {
  default     = []
  description = "The database flags for Cloud SQL. See [PostgreSQL Flags](https://cloud.google.com/sql/docs/postgres/flags)"
  type = list(object({
    name  = string
    value = string
  }))
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "query_insights_enabled" {
  default     = true
  description = "True if Query Insights feature is enabled"
  type        = bool
}

variable "query_plans_per_minute" {
  default     = 5
  description = "Number of query execution plans captured by Insights per minute for all queries combined. Between 0 and 20"
  type        = number
}

variable "query_string_length" {
  default     = 1024
  description = "Maximum query length stored in bytes. Between 256 and 4500"
  type        = number
}

variable "record_application_tags" {
  default     = true
  description = "True if Query Insights will record application tags from query when enabled"
  type        = bool
}

variable "record_client_address" {
  default     = true
  description = "True if Query Insights will record client address when enabled"
  type        = bool
}

variable "region" {
  description = "The region in which the resource belongs"
  type        = string
}

variable "update_track" {
  default     = "stable"
  description = "Receive updates earlier"
  type        = string
}
