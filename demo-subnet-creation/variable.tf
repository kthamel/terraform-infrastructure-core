resource "aws_subnet" "demo_subnet" {
  cidr_block              = "172.33.0.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.demo_vpc.id
  availability_zone       = "us-east-1a"
}