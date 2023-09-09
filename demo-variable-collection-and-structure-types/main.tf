## Referencing to the variable called environment ##
## If run terraform plan -var environment="prod" << this will choose the prod value ##
resource "aws_vpc" "dev-vpc" {
  cidr_block = var.cidr_block[var.environment]

  tags = {
    Name = "Dev-VPC"
    Provisioner = "kthamel@mac.lan"
  }
}
