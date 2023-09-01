module "postgresql" {
  environment = "dev"
  publicly_accessible = true
  skip_final_snapshot = true
  backup_window       = "03:00-06:00"
  maintenance_window  = "Mon:00:00-Mon:03:00"
  deletion_protection = false
}
