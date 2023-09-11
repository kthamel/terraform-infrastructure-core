resource "aws_instance" "iac-ec2-instance" {
  ami             = "ami-08a52ddb321b32a8c"
  instance_type   = "t2.micro"
  security_groups = ["sg-079949240623ebe3d"]
  subnet_id       = "subnet-0f3a728bed8319097"
}
