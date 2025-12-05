resource "aws_s3_bucket" "bucket" {
  bucket = "heyyy-mahiiie"

}

resource "aws_s3_object" "obj" {
  bucket = aws_s3_bucket.bucket.id
  key = "app.js"
  source = "./app.js"
}

