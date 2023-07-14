resource "harness_platform_secret_text" "aws_access_key_id" {
  identifier                = "aws_access_key_id"
  name                      = "aws_access_key_id"
  description               = "short lived aws access key id for accessing aws beach"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_ACCESS_KEY_ID
}

resource "harness_platform_secret_text" "aws_secret_access_key" {
  identifier                = "aws_secret_access_key"
  name                      = "aws_secret_access_key"
  description               = "short lived aws secret access key for accessing aws beach"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_SECRET_ACCESS_KEY
}

resource "harness_platform_secret_text" "aws_session_token" {
  identifier                = "aws_session_token"
  name                      = "aws_session_token"
  description               = "short lived aws session token for accessing aws beach"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_SESSION_TOKEN
}

resource "harness_platform_secret_text" "github_pat_token" {
  identifier                = "github_pat_token"
  name                      = "github_pat_token"
  description               = "pat token to give read only access for all repositories in punam-shelke account for cloning"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.GITHUB_PAT_TOKEN
}

resource "harness_platform_secret_text" "harness_account_id" {
  identifier                = "harness_account_id"
  name                      = "harness_account_id"
  description               = "account id for accessing and creating infrastructure inside harness"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.HARNESS_ACCOUNT_ID
}

resource "harness_platform_secret_text" "harness_platform_api_key" {
  identifier                = "harness_platform_api_key"
  name                      = "harness_platform_api_key"
  description               = "account id for accessing and creating infrastructure inside harness"
  org_id                    = "default"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.HARNESS_PLATFORM_API_KEY
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

