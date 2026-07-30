# Output Values
# https://opentofu.org/docs/language/values/outputs

output "instance" {
  description = "SQL instance name"
  value       = module.test.instance
}
