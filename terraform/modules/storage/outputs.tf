// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

output "src_bucket_arn" {
  value = aws_s3_bucket.src_bucket.arn
}

output "src_bucket_id" {
  value = aws_s3_bucket.src_bucket.id
}

output "dst_bucket_arn" {
  value = aws_s3_bucket.dst_bucket.arn
}

output "dst_bucket_id" {
  value = aws_s3_bucket.dst_bucket.id
}

