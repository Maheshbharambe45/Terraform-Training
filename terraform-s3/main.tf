resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "My-Bucket"
  }
}

resource "aws_s3_object" "obj1" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "app.js"
  source = "./app.js"
}

resource "aws_s3_object" "obj2" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "index.html"
  source = "./index.html"
}