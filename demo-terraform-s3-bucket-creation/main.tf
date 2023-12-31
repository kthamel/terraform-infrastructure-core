resource "aws_s3_bucket" "a-new-s3-bucket" {
  bucket = "kthamel-cloud-automation-s3-${random_string.rnd-string.id}"

  tags = {
    Name    = "Terraform"
    Project = "New-01"
  }
}

resource "random_string" "rnd-string" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

output "test-value" {
  value = aws_s3_bucket.a-new-s3-bucket.id
  sensitive = true
}
