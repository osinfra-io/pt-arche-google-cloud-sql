# Output Values
# https://opentofu.org/docs/language/values/outputs

output "client_cert" {
  description = "The client certificate"
  sensitive   = true
  value       = local.client_cert
}

output "instance" {
  description = "SQL instance name"
  value       = google_sql_database_instance.this.name
}

output "instance_server_ca_cert" {
  description = "The SQL instance server CA certificate"
  sensitive   = true
  value       = google_sql_database_instance.this.server_ca_cert
}

output "private_ip_address" {
  description = "SQL instance private IP address"
  value       = google_sql_database_instance.this.private_ip_address
}

output "private_key" {
  description = "The client private key"
  sensitive   = true
  value       = local.client_private_key
}
