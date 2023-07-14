resource "harness_platform_connector_github" "github_organisation_connector" {
  identifier          = "identifier"
  name                = "name"
  description         = "test"
  url                 = "https://github.com/divya-poonam/"
  connection_type     = "Account"
  validation_repo     = "simple-java-maven-app"
  execute_on_delegate = false
  org_id              = "default"
  credentials {
    http {
      username  = "punam-shelke"
      token_ref = "org.github_pat_token"
    }
  }
  api_authentication {
    token_ref = "org.github_pat_token"
  }
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}
