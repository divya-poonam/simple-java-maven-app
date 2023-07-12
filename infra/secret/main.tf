resource "harness_platform_secret_text" "aws_access_key_id" {
  identifier                = "aws_access_key_id"
  name                      = "aws_access_key_id"
  description               = "short lived aws access key id for accessing aws beach"
  org_id                    = "default"
  project_id                = "harnessdemo"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_ACCESS_KEY_ID

}

resource "harness_platform_secret_text" "aws_secret_access_key" {
  identifier                = "aws_secret_access_key"
  name                      = "aws_secret_access_key"
  description               = "short lived aws secret access key for accessing aws beach"
  org_id                    = "default"
  project_id                = "harnessdemo"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_SECRET_ACCESS_KEY

}

resource "harness_platform_secret_text" "aws_session_token" {
  identifier                = "aws_session_token"
  name                      = "aws_session_token"
  description               = "short lived aws session token for accessing aws beach"
  org_id                    = "default"
  project_id                = "harnessdemo"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.AWS_SESSION_TOKEN

}

resource "harness_platform_secret_text" "github_pat_token" {
  identifier                = "github_pat_token"
  name                      = "github_pat_token"
  description               = "pat token to give read only access for all repositories in punam-shelke account for cloning"
  org_id                    = "default"
  project_id                = "harnessdemo"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.GITHUB_PAT_TOKEN

}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-secret.tfstate"
    region = "ap-south-1"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.HARNESS_ACCOUNT_ID
  platform_api_key = var.HARNESS_PLATFORM_API_KEY
}

