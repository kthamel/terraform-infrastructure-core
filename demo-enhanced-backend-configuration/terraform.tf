terraform {
  backend "s3" {
    bucket         = "kthamel-cloud-automation-tfimport"
    key            = "demo_key"
    region         = "us-east-1"
    dynamodb_table = "iac-terraform"
    encrypt        = true
  }
}