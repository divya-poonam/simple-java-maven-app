module "harness_bootstrap_project" {
  source = "./project"
}

module "harness_organisation_secrets" {
  source                   = "./secret"
  AWS_ACCESS_KEY_ID        = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY    = var.AWS_SECRET_ACCESS_KEY
  AWS_SESSION_TOKEN        = var.AWS_SESSION_TOKEN
  HARNESS_ACCOUNT_ID       = var.HARNESS_ACCOUNT_ID
  HARNESS_PLATFORM_API_KEY = var.HARNESS_PLATFORM_API_KEY
  GITHUB_PAT_TOKEN         = var.GITHUB_PAT_TOKEN
}

module "harness_github_connector" {
  source     = "./connector"
  depends_on = [module.harness_organisation_secrets]
}

module "harness_bootstrap_pipelines" {
  source                   = "./pipeline"
  HARNESS_ACCOUNT_ID       = var.HARNESS_ACCOUNT_ID
  HARNESS_PLATFORM_API_KEY = var.HARNESS_PLATFORM_API_KEY

  depends_on = [module.harness_bootstrap_project]
}