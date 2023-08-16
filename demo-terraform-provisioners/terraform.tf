terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}
