terraform {
  backend "s3" {
    bucket = "kthamel-cloud-automation-modules"
    key    = "module-rds"
    region = "us-east-1"
  }
}

