terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "demo-terraform-cloud-v1"

    workspaces {
      name = "terraform-remote-state"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}
