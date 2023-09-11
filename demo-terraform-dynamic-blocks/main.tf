locals {
  ingress_rules = [
    {
      port        = "110"
      description = "Allow POP3"
      protocol    = "TCP"
      cidr_blocks = ["172.31.0.0/16"]
    },
    {
      port        = "143"
      description = "Allow IMAP"
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

  ingress {
    description = "Allow SSH"
    protocol    = "TCP"
    from_port   = "22"
    to_port     = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow to all ports"
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name           = "TF-MANAGED-SG"
    Provisioned_By = "KTHAMEL@MAC.LAN"
  }
}
