resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "jenkins-s3-bucket-dcb"

  tags = {
    Name = "Jenkins S3 Bucket"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket     = aws_s3_bucket.my_s3_bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}