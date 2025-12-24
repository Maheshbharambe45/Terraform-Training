variable "bucket_name" {
  type = string
  default = "heyyyyyy-mahiiiii45"
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}