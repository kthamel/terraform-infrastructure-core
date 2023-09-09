## Referencing to the variable called environment ##
## If run terraform plan -var environment="prod" << this will choose the prod value ##
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.cidr_block[var.environment]

  tags = {
    Name = "Dev-VPC"
    Provisioner = "kthamel@mac.lan"
  }
}

resource "aws_subnet" "tf-subnet" {
  vpc_id = aws_vpc.tf-vpc.id
  availability_zone = var.cidr_block[var.environment]
  cidr_block = var.cidr_block[var.environment]
}
