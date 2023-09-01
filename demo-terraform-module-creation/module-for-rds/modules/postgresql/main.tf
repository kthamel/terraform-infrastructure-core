module "postgresql" {
  environment = "dev"
  publicly_accessible = true
  skip_final_snapshot = true
  backup_window       = "03:00-06:00"
  maintenance_window  = "Mon:00:00-Mon:03:00"
  deletion_protection = false
  source            = "../modules"
  engine            = "postgres"
  engine_version    = "15.3"
  identifier        = "kthamel-postgres"
  db_name           = "POSTGRES"
  username          = "userdba"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  password          = random_password.dbpasswd.result
}
