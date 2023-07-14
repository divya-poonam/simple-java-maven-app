resource "harness_platform_pipeline" "demo_pipeline" {
  identifier       = "demo_pipeline"
  name             = "demo_pipeline"
  org_id           = "default"
  project_id       = "harness_bootstrap"
  template_applied = false
  yaml             = file("../../.harness/demo-pipeline.yaml")
}

resource "harness_platform_pipeline" "demo_project" {
  identifier       = "demo_project"
  name             = "demo_project"
  org_id           = "default"
  project_id       = "harness_bootstrap"
  template_applied = false
  yaml             = file("../../.harness/demo-project.yaml")
}

resource "harness_platform_pipeline" "infra_pipeline" {
  identifier       = "infra_pipeline"
  name             = "infra_pipeline"
  org_id           = "default"
  project_id       = "harness_bootstrap"
  template_applied = false
  yaml             = file("../../.harness/infra-pipeline.yaml")
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

