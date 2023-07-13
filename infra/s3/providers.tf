terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "harness-infrastructure-state-bucket"
    key    = "harness-artifacts-bucket.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = local.region
}
