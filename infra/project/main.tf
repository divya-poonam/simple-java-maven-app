resource "harness_platform_project" "harnessdemo" {
  color       = "#0063f7"
  description = "This project is created to give basic harness demo. This project will have a sample pipeline to explore CI features."
  identifier  = "harnessdemo"
  name        = "harness-demo"
  org_id      = "default"
  tags        = []
}

terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-project.tfstate"
    region = "ap-south-1"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.HARNESS_ACCOUNT_ID
  platform_api_key = var.HARNESS_PLATFORM_API_KEY
}

