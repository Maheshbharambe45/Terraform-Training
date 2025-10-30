resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_object" "myobj" {
    bucket = var.bucket_name
    key = "app.js"
    source = "./app.js"
}