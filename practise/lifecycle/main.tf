resource "aws_s3_bucket" "this" {
  bucket = "heyyyy-devopsss-012"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "terraform Buckets"
  }
}