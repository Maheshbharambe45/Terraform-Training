resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

tags = {
  Name =  var.bucket_name
}
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key = "outputs.tf"
  source = "./outputs.tf"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}