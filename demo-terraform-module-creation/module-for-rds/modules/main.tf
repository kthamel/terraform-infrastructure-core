module "postgresql" {
  // source                           = "squareops/rds-postgresql/aws"
  // name                             = "postgresql"
  // db_name                          = "proddb"
  // vpc_id                           = "vpc-047eb8acfb73"
  // multi_az                         = "true"
  // subnet_ids                       = ["subnet-b39cfc", "subnet-090b8d8"]
  environment                      = "prod"
  // kms_key_arn                      = "arn:aws:kms:region:2222222222:key/f8c8d802-a34b"
  // engine_version                   = "15.2"
  instance_class                   = "db.m5.large"
  // master_username                  = "pguser"
  allocated_storage                = "20"
  publicly_accessible              = false
  skip_final_snapshot              = true
  backup_window                    = "03:00-06:00"
  maintenance_window               = "Mon:00:00-Mon:03:00"
  // major_engine_version             = "15.2"
  deletion_protection              = false
  //allowed_security_groups          = ["sg-013cbf880"]
  final_snapshot_identifier_prefix = "final"
}