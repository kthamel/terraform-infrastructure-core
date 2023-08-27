module "postgresql" {
  environment = "dev"
  publicly_accessible = true
  skip_final_snapshot = false
  backup_window       = "03:00-06:00"
  maintenance_window  = "Mon:00:00-Mon:03:00"
  deletion_protection = false
  vpc_id              = "vpc-0f56bc3804d01f5f7"
  security_griup_id   = "sg-043ebf4a6843ed9fa"
  subnet_ids          = ["subnet-0e94e9704e935ac91", "subnet-0a029405a1776863a"]
}
