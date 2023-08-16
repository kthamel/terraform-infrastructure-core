terraform {
  required_version = ">1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">1.0.0"
    }
    http = {
        source = "hashicorp/http"
        version = ">1.0.0"
    }
  }
}