terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "demo-terraform-cloud-v1"

    workspaces {
      name = "terraform-remote-state"
    }
  }
}
