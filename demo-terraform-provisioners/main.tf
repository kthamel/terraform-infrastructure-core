resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "ec2_ssh_key.pem"
}

resource "aws_key_pair" "ssh_key_pub" {
  key_name   = "ec2_ssh_key"
  public_key = tls_private_key.ssh_key.public_key_openssh

  lifecycle {
    ignore_changes = [key_name]
  }
}

resource "aws_instance" "demo-ec2" {
  ami             = "ami-08a52ddb321b32a8c"
  instance_type   = "t2.micro"
  security_groups = ["sg-079949240623ebe3d"]
  subnet_id       = "subnet-0f3a728bed8319097"
  key_name        = aws_key_pair.ssh_key_pub.key_name
  connection {
    user        = "ec2-user"
    private_key = tls_private_key.ssh_key.private_key_pem
    host        = self.public_ip
  }

  tags = {
    Name    = "Provisioners"
    Project = "IAC"
  }

  provisioner "local-exec" {
    command = "chmod 0400 ${local_file.private_key_pem.filename}"
  }
  provisioner "remote-exec" {
    inline = [
      "rm -rf /tmp/*",
      "echo Hello World > /tmp/kthamel-iac.txt"
    ]

  }
}