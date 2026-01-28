resource "aws_s3_bucket" "this" {
  bucket = "heyyy-seriiii"
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key = "style.css"
  source = "./style.css"
}