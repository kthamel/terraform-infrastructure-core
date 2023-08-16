resource "aws_subnet" "iac-terraform-private-subnet-1" {
  vpc_id     = aws_vpc.iac-terraform.id
  cidr_block = "172.32.0.0/24"

  tags = {
    Name = "iac-terraform-private-subnet-1"
  }
}

resource "aws_subnet" "iac-terraform-private-subnet-2" {
  vpc_id     = aws_vpc.iac-terraform.id
  cidr_block = "172.32.1.0/24"

  tags = {
    Name = "iac-terraform-private-subnet-2"
  }
}

resource "aws_subnet" "iac-terraform-private-subnet-3" {
  vpc_id     = aws_vpc.iac-terraform.id
  cidr_block = "172.32.2.0/24"

  tags = {
    Name = "iac-terraform-private-subnet-3"
  }
}

resource "aws_subnet" "iac-terraform-public-subnet-1" {
  vpc_id                  = aws_vpc.iac-terraform.id
  cidr_block              = "172.32.10.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "iac-terraform-public-subnet-1"
  }
}

resource "aws_subnet" "iac-terraform-public-subnet-2" {
  vpc_id                  = aws_vpc.iac-terraform.id
  cidr_block              = "172.32.11.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "iac-terraform-public-subnet-2"
  }
}

resource "aws_subnet" "iac-terraform-public-subnet-3" {
  vpc_id                  = aws_vpc.iac-terraform.id
  cidr_block              = "172.32.12.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "iac-terraform-public-subnet-3"
  }
}

resource "aws_internet_gateway" "iac-terraform-igw" {
  vpc_id = aws_vpc.iac-terraform.id

  tags = {
    Name = "iac-terraform-igw"
  }
}

resource "aws_route_table" "iac-terraform-routing-table" {
  vpc_id = aws_vpc.iac-terraform.id

  route {
    cidr_block = "172.32.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iac-terraform-igw.id
  }

  tags = {
    Name = "iac-terraform-routing-table"
  }
}