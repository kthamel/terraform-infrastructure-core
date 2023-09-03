terraform {
  backend "s3" {
    bucket         = "kthamel-cloud-automation-tfimport"
    key            = "LockId"
    region         = "us-east-1"
    # dynamodb_table = "iac-terraform"
    # encrypt        = true
  }
}
