# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "client_certs" {
  type = set(string)
}

variable "host_project_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "project" {
  type = string
}
