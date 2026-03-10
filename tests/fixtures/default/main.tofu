# Required Providers
# https://opentofu.org/docs/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

module "test" {
  source = "../../../regional"

  client_certs = var.client_certs

  postgres_database_flags = [
    {
      name  = "mock"
      value = "on"
    }
  ]

  deletion_protection            = false
  host_project_id                = var.host_project_id
  instance_name                  = var.instance_name
  labels                         = local.labels
  network                        = "mock-vpc"
  point_in_time_recovery_enabled = true
  project                        = var.project
  region                         = "mock-region"
}
