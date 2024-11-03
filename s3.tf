# S3 Bucket for Artifacts
resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "capgem-artifact-${var.environment}-bucket"

  tags = {
    Name        = "Artifact Bucket"
    Environment = var.environment
  }
}

# Separate S3 Bucket Versioning Resource for Artifact Bucket
resource "aws_s3_bucket_versioning" "artifact_bucket_versioning" {
  bucket = aws_s3_bucket.artifact_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket Public Access Block for Artifact Bucket
resource "aws_s3_bucket_public_access_block" "artifact_bucket_pab" {
  bucket = aws_s3_bucket.artifact_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}



# IAM Policy for CodePipeline Assume Role and Permissions
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com", "codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
