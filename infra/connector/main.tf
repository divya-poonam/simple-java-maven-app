
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

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-connector.tfstate"
    region = "ap-south-1"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.HARNESS_ACCOUNT_ID
  platform_api_key = var.HARNESS_PLATFORM_API_KEY
}

