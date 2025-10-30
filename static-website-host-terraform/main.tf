resource "aws_s3_bucket_policy" "my-policy" {
    bucket = heyyy-seriiii

    policy = file("policy.json")
}

