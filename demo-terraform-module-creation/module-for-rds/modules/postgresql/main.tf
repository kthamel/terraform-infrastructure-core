module "postgresql" {
  source              = "terraform-aws-modules/rds/aws"
  publicly_accessible = true
  skip_final_snapshot = true
  backup_window       = "03:00-06:00"
  maintenance_window  = "Mon:00:00-Mon:03:00"
  deletion_protection = false
  identifier        = "kthamel-postgres"
  engine            = "postgres"
  engine_version    = "15.3"
}

module "rds_db_parameter_group" {
  source  = "terraform-aws-modules/rds/aws//modules/db_parameter_group"
  version = "6.1.1"
  family = "default"
}
