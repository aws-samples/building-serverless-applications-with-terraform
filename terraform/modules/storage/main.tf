resource "aws_s3_bucket" "src_bucket" {
  bucket = var.src_bucket_name
  tags = {
    environment = var.tag_environment
  }
}

resource "aws_s3_bucket_ownership_controls" "src_bucket_ownership_controls" {
  bucket = aws_s3_bucket.src_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "src_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.src_bucket_ownership_controls]
  bucket     = aws_s3_bucket.src_bucket.id
  acl        = "private"
}

resource "aws_s3_bucket" "dst_bucket" {
  bucket = var.dst_bucket_name

  tags = {
    environment = var.tag_environment
  }
}

resource "aws_s3_bucket_ownership_controls" "dst_bucket_ownership_controls" {
  bucket = aws_s3_bucket.dst_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "dst_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.dst_bucket_ownership_controls]
  bucket     = aws_s3_bucket.dst_bucket.id
  acl        = "private"
}
