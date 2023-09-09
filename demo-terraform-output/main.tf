locals {
  Name    = "IaC Terraform"
  Project = "Test"
  User    = "kthamel"
}

resource "random_string" "random-string" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "new-s3-bucket-1" {
  bucket = "kthamel-cloud-automation-s3-${random_string.random-string.id}-1"

  tags = {
    Name    = "Terraform"
    Project = "New-01"
    User    = var.user
  }
}

output "bucket-name" {
  description = "Print new S3 bucket name"
  value = aws_s3_bucket.new-s3-bucket-1.id
}