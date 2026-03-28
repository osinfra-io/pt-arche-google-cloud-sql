# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "client_certs" {
  description = "Set of client certificate names to create for Cloud SQL instances"

  type = set(string)
}

variable "host_project_id" {
  description = "The project ID of the shared VPC host project"

  type = string
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance"

  type = string
}

variable "project" {
  description = "The Google Cloud project ID"

  type = string
}
