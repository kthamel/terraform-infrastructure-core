terraform {
  cloud {
    organization = "demo-terraform-cloud-v1"

    workspaces {
      name = "terraform-cloud-based-module"
    }
  }
  required_providers {
    aws = {
      #Wsource  = "hashicorp/aws"
      version = ">5.0.0"
    }
  }
}
