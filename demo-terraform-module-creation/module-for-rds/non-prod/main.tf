resource "aws_s3_bucket" "backend-s3-bucket" {
  bucket = "kthamel-cloud-automation-modules"

  tags = {
    Name = "Terraform"
  }
}

module "postgresql" {
    source = "../modules"
}

resource "aws_db_instance" "kthamel-postgres" {
  instance_class    = "db.t3.micro"
}


resource "random_password" "dbpasswd" {
  length  = 16
  special = false
  lower   = true
  upper   = true
  numeric = true
}

resource "aws_secretsmanager_secret" "password" {
  name = "kthamel-postgres-db-password"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.dbpasswd.result
}
