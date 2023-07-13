resource "aws_s3_bucket" "artifact_store" {
  bucket = local.bucket_name
  tags   = local.tags
}