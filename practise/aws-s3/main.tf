resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags = {
    Name = "terrafor-bucket"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key = "variables.tf"
  source = "./variables.tf"
}