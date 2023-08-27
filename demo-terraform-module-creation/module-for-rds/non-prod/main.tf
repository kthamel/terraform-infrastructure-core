resource "aws_s3_bucket" "backend-s3-bucket" {
  bucket = "kthamel-cloud-automation-modules"

  tags = {
    Name = "Terraform"
  }
}

resource "aws_db_instance" "kthamel-postgres" {
  identifier        = "kthamel-postgres"
  db_name           = "POSTGRES"
  username          = "userdba"
  instance_class    = "db.t3.micro"
  engine            = "postgres"
  engine_version    = "15.3"
  allocated_storage = 20
  password          = random_password.dbpasswd.result
        
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
