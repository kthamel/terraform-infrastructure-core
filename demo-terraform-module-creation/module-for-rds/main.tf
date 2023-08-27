resource "aws_db_instance" "kthamel-postgres" {
  identifier        = "kthamel-postgres"
  db_name           = "POSTGRES"
  username          = "userdba"
  instance_class    = "db.t3.micro"
  engine            = "postgres"
  engine_version    = "15.3"
  allocated_storage = 20
  password          = random_string.dbpasswd.result
}

resource "random_string" "dbpasswd" {
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
  secret_string = random_string.dbpasswd.result
}
