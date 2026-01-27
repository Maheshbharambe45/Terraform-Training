resource "aws_s3_bucket" "this" {
  bucket = var.Bucket_name

  tags = {
    Name = var.Tag_name
  }
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = "app.js"
  source = "./app.js"
}

