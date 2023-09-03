module "demo-rds-1" {
  source = "../modules/postgresql"
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
