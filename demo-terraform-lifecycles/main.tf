locals {
  ingress_rules = [
    {
      port        = "110"
      description = "Allow POP3"
      protocol    = "TCP"
      cidr_blocks = ["172.31.0.0/16"]
    }
  ]
}

resource "aws_security_group" "terraform_sg" {
  description = "terraform managed security group"
  name        = "terraform-sg"
  vpc_id      = "vpc-0f56bc3804d01f5f7"
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name           = "TF-MANAGED-SG"
    Provisioned_By = "KTHAMEL@MAC.LAN"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "terraform_sg_1" {
  description = "terraform managed security group"
  name        = "terraform-sg_1"
  vpc_id      = "vpc-0f56bc3804d01f5f7"
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name           = "TF-MANAGED-SG"
    Provisioned_By = "KTHAMEL@MAC.LAN"
  }

#   lifecycle {
#     prevent_destroy = true
#   }
}

resource "aws_instance" "iac-ec2-instance" {
  ami             = "ami-08a52ddb321b32a8c"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-074038bd04c9a3b8b"
  security_groups = ["${aws_security_group.terraform_sg.id}"]

  tags = {
    Name           = "TF-MANAGED-SG"
    Provisioned_By = "KTHAMEL@MAC.LAN"
  }
}
