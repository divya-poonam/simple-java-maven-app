resource "harness_platform_project" "harness_bootstrap" {
  color       = "#ff99c2"
  description = "This project is created for bootstrapping demo harness project and pipeline"
  identifier  = "harness_bootstrap"
  name        = "harness-bootstrap"
  org_id      = "default"
  tags        = []
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}
