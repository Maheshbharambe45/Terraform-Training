resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "My-Bucket"
  }
}

resource "aws_s3_object" "obj1" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "index.html"
  source = "./index.html"
  content_type = "text/html"
  
  etag = filemd5("./index.html")
}


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.my_bucket.bucket
  policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Sid       = "AllowPublicRead"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
    }
  ]
})
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

output "bucket_op" {
  value = aws_s3_bucket_website_configuration.example.website_endpoint
}
