terraform {
  backend "s3" {
    bucket         = "kthamel-cloud-automation-s3-vppl2"
    key            = "LockId"
    region         = "us-east-1"
  }
}