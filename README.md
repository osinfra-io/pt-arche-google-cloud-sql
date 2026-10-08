# Google Cloud Platform - Cloud SQL OpenTofu Module

[![OpenTofu Tests](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-google-cloud-sql/test.yml?style=for-the-badge&logo=opentofu&color=FEDA15&label=OpenTofu%20Tests)](https://github.com/osinfra-io/pt-arche-google-cloud-sql/actions/workflows/test.yml) [![Dependabot](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-google-cloud-sql/dependabot.yml?style=for-the-badge&logo=github&color=2088FF&label=Dependabot)](https://github.com/osinfra-io/pt-arche-google-cloud-sql/actions/workflows/dependabot.yml) [![Datadog Security Enabled](https://img.shields.io/badge/Datadog%20Security-Enabled-632CA6?style=for-the-badge&logo=datadog)](https://app.datadoghq.com/security/code-security/repositories?repository_id=pt-arche-google-cloud-sql)

## Repository Description

Reusable OpenTofu child module for a private-IP Google Cloud SQL instance.

## 🔩 Usage

### Module interface

Consume `//regional` with `source = "github.com/osinfra-io/pt-arche-google-cloud-sql//regional?ref=<commit_sha>"`. See [`regional/variables.tofu`](regional/variables.tofu) and [`regional/outputs.tofu`](regional/outputs.tofu).

The module defaults to a regional PostgreSQL 16 Enterprise instance on `db-f1-micro`, with automated backups, Query Insights, encrypted-only connections, private IPv4 networking, and deletion protection enabled. Point-in-time recovery is disabled by default. Client certificate private keys and server CA material are sensitive outputs and must be handled as secrets. Cloud SQL, regional high availability, backups, Query Insights, and larger machine tiers incur ongoing GCP costs; disabling deletion protection or changing network/database settings can be disruptive.

> [!TIP]
> You can check the [tests/fixtures](tests/fixtures) directory for example configurations. These fixtures set up the system for testing by providing all the necessary initial code, thus creating good examples on which to base your configurations.

Google project services must be enabled before using this module. As a best practice, these should be defined in the [pt-arche-google-project](https://github.com/osinfra-io/pt-arche-google-project) module. The following services are required:

- `sqladmin.googleapis.com`
- `servicenetworking.googleapis.com`

## 🛠️ Tools

- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pt-techne-pre-commit-hooks)
- [pre-commit](https://github.com/pre-commit/pre-commit)

## 📋 Skills and Knowledge

- [cloud sql](https://cloud.google.com/sql/docs)

## 🔍 Tests

Tests use [mocked providers](https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks); no infrastructure or credentials are required.

```none
tofu init
```

```none
tofu test
```

## 📦 Release

To release a new version, simply push a new tag to the repository. The tag should be in the format `vX.Y.Z` where `X`, `Y`, and `Z` are integers.

```none
git tag vX.Y.Z
git push origin vX.Y.Z
```
