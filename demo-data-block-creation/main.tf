locals {
  Platform_name = var.platform_name
  Owner         = var.owners-email
  Application   = var.app-id
  Ticket        = "DO001"
}

data "aws_region" "current" {

}

resource "aws_instance" "demo-ec2" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  subnet_id     = "subnet-074038bd04c9a3b8b"

  tags = {
    Name   = local.Platform_name
    Owner  = local.Owner
    App    = local.Application
    Job_ID = local.Ticket
    Region = data.aws_region.current.description
  }
}