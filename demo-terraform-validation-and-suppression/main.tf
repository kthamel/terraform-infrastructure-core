resource "random_string" "test-string" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "a-new-s3-bucket" {
  bucket = "kthamel-cloud-automation-${random_string.test-string.id}"

  tags = {
    Name    = "Terraform"
    Project = var.project
  }
}
