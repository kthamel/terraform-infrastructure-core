terraform {
  backend "s3" {
    bucket = "kthamel-cloud-automation-s3-ld06a"
    key    = "module-s3"
    region = "us-east-1"
  }
}
