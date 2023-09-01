module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"
  ami             = "ami-08a52ddb321b32a8c"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-0f3a728bed8319097"

    tags = {
    Name = "demo-module-instance"
  }
}
