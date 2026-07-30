# Test
# https://opentofu.org/docs/cli/commands/test

# Mock Providers
# https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks

mock_provider "google" {}
mock_provider "random" {}

run "default" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }
}

variables {
  client_certs = [
    "mock-client-cert-a",
    "mock-client-cert-b"
  ]

  host_project_id = "mock-host-project"
  instance_name   = "mock-instance"
  project         = "mock-project"
}

run "deterministic_instance_name" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }

  variables {
    random_id_suffix = false
  }

  assert {
    condition     = output.instance == "mock-instance-mock-region"
    error_message = "Instance name should omit the random ID suffix when random_id_suffix is false"
  }
}
