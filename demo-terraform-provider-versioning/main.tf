terraform {
  required_version = ">1.0.0"
}

resource "random_string" "random_passwd" {
  length  = 10
  special = false
  lower   = true
  upper   = false
  numeric = true
}

resource "aws_s3_bucket" "random-bucket" {
  bucket = "kthamel-provider-${random_string.random_passwd.id}"
}