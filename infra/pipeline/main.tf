resource "harness_platform_pipeline" "demo_pipeline" {
  identifier       = "simplejavamavenapp"
  name             = "simple-java-maven-app"
  org_id           = "default"
  project_id       = "harnessdemo"
  template_applied = false
  yaml             = file("../../.harness/simple-java-maven-app.yaml")
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-pipeline.tfstate"
    region = "ap-south-1"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.HARNESS_ACCOUNT_ID
  platform_api_key = var.HARNESS_PLATFORM_API_KEY
}

