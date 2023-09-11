resource "aws_s3_bucket" "demo_bucket" {
  bucket = "kthamel-multiple-provider-${random_string.rand_string.id}"
}

resource "random_string" "rand_string" {
  length  = 6
  lower   = true
  upper   = false
  numeric = true
  special = false
}