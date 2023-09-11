terraform {
  backend "s3" {
    bucket = "kthamel-cloud-automation-eks"
    key    = "demo-vpc-tfstate"
    region = "us-east-1"
  }
}