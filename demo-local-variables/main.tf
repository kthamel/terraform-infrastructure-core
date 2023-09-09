locals {
  Name    = "Kushan Thamel"
  Project = "Project Terraform"
  Team    = "Local Team"
}

locals {
  common_tags = {
    DevOps_Name    = local.Name  
    DevOps_Project = local.Project
    DevOps_Team    = local.Team
  }
}

resource "random_string" "test-string" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "a-new-s3-bucket" {
  bucket = "kthamel-cloud-automation-s3-${random_string.test-string.id}"

  tags = {
    Provisioned_By     = local.Name
  }

}

resource "random_string" "random-string" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "b-new-s3-bucket" {
  bucket = "kthamel-cloud-automation-s3-${random_string.random-string.id}"

  tags = local.common_tags

}