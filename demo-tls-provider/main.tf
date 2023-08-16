resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content = tls_private_key.generated.private_key_pem
  filename = "ec2_ssh_key.pem"
}  

