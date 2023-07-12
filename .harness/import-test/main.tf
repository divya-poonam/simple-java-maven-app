resource "harness_platform_project" "harnessdemo" {
  color       = "#0063f7"
  description = "This project is created to give basic harness demo. This project will have a sample pipeline to explore CI features."
  identifier  = "harnessdemo"
  name        = "harness-demo"
  org_id      = "default"
  tags        = []
}

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

resource "harness_platform_connector_github" "test" {
  identifier  = "identifier"
  name        = "name"
  description = "test"
  url                = "https://github.com/divya-poonam/"
  connection_type    = "Account"
  validation_repo    = "simple-java-maven-app"
  execute_on_delegate=false
  org_id           = "default"
  project_id       = "harnessdemo"
  credentials {
    http {
      username  = "punam-shelke"
      token_ref = harness_platform_secret_text.github_pat_token.id
    }
  }
  api_authentication {
    token_ref = harness_platform_secret_text.github_pat_token.id
  }

}

resource "harness_platform_pipeline" "demo_pipeline" {
  identifier       = "simplejavamavenapp"
  name             = "simple-java-maven-app"
  org_id           = "default"
  project_id       = harness_platform_project.harnessdemo.identifier
  template_applied = false
  yaml             = file("../simple-java-maven-app.yaml")
  git_details {
    branch_name = "master"
    file_path   = ".harness/simple-java-maven-app.yaml"
    repo_name   = "simple-java-maven-app"
  }
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-import-test.tfstate"
    region = "ap-south-1"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.HARNESS_ACCOUNT_ID
  platform_api_key = var.HARNESS_PLATFORM_API_KEY
}

