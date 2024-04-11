resource "aws_s3_bucket" "artifactforthreeprat" {
    bucket = "artifactforthreeprat"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifactforthreeprat.id 
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.artifactforthreeprat.bucket 
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "pubaccess" {
  bucket                  = aws_s3_bucket.artifactforthreeprat.bucket
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.owner,
    aws_s3_bucket_public_access_block.pubaccess
  ]
  bucket = aws_s3_bucket.artifactforthreeprat.bucket 
  acl    = "public-read-write"
}
resource "aws_s3_object" "artifactforthreeprat" {
  bucket = aws_s3_bucket.artifactforthreeprat.bucket 
  key    = "mysql-connector.jar"
  source = "/mnt/c/Users/pratik/Desktop/Webapps/mysql-connector.jar"
}