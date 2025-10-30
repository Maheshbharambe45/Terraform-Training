output "bucket_output" {
  value = aws_s3_bucket.bucket.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.bucket.bucket_region
}