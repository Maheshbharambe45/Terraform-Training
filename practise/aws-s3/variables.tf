variable "Bucket_name" {
  default = "heyyyyyyy-shreeeeee"
  type    = string
}

variable "Tag_name" {
  default = "Shreeeeee"
  type    = string
}


output "Bucket_arn" {
  value = aws_s3_bucket.this.arn
}