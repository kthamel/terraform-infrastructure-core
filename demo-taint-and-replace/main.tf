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

resource "aws_secretsmanager_secret" "ec2-private-key" {
  name = "kthamel-ec2-private-key-password"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.ec2-private-key.id
  secret_string = tls_private_key.ssh_key.private_key_pem
}

resource "aws_instance" "demo-ec2" {
  ami             = "ami-08a52ddb321b32a8c"
  instance_type   = "t2.micro"
  security_groups = ["sg-043ebf4a6843ed9fa"]
  subnet_id       = "subnet-074038bd04c9a3b8b"
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
      "sudo rm -rf /tmp/*",
      "sudo echo Hello World > /tmp/kthamel-iac.txt"
    ]

  }
}