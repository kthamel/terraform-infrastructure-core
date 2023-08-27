resource "aws_vpc" "cloud-automation" {
  vpc_id           = "vpc-0f56bc3804d01f5f7"
  region           = "us-east-1"
}

resource "aws_subnet" "cloud-automation-private-subnet" {
  vpc_id            = aws_vpc.cloud-automation.id
  availability_zone = "us-east-1a"
  subnet_ids        = ["subnet-0e94e9704e935ac91", "subnet-0a029405a1776863a"]
}

resource "aws_security_group" "cloud-automation-security-group" {
  security_griup_id = "sg-043ebf4a6843ed9fa"
  vpc_id            = aws_vpc.cloud-automation.id
}
