locals {
  identifier_5fc703ad85 = "finisterra"
}

module "aws_db_instance-finisterra" {
  source                              = "github.com/finisterra-io/terraform-aws-rds.git?ref=main"
  create_db_instance                  = true
  create_db_subnet_group              = true
  create_db_parameter_group           = false
  create_db_option_group              = false
  manage_master_user_password         = false
  identifier                          = local.identifier_5fc703ad85
  engine                              = "postgres"
  engine_version                      = "14.7"
  instance_class                      = "db.t3.micro"
  allocated_storage                   = 20
  storage_type                        = "gp2"
  storage_encrypted                   = true
  kms_key_id                          = "arn:${local.aws_partition}:kms:${local.aws_region}:${local.aws_account_id}:key/04945c14-4f85-4cde-b045-b94f392ce5c4"
  license_model                       = "postgresql-license"
  username                            = "postgres"
  port                                = 5432
  iam_database_authentication_enabled = false
  vpc_security_group_ids = [
    "sg-01bfa99b71a44419b"
  ]
  db_subnet_group_name                  = "${local.identifier_5fc703ad85}-private"
  parameter_group_name                  = "default.postgres14"
  option_group_name                     = "default:postgres-14"
  network_type                          = "IPV4"
  availability_zone                     = "${local.aws_region}b"
  multi_az                              = false
  iops                                  = 0
  storage_throughput                    = 0
  publicly_accessible                   = false
  ca_cert_identifier                    = "rds-ca-2019"
  auto_minor_version_upgrade            = true
  apply_immediately                     = false
  maintenance_window                    = "wed:10:16-wed:10:46"
  copy_tags_to_snapshot                 = true
  skip_final_snapshot                   = false
  performance_insights_enabled          = false
  performance_insights_retention_period = 0
  backup_retention_period               = 0
  backup_window                         = "05:36-06:06"
  max_allocated_storage                 = 0
  monitoring_interval                   = 0
  deletion_protection                   = true
  delete_automated_backups              = true
  tags = {
    "Name" : "Finisterra"
  }
  db_instance_tags = {
    "Name" : "Finisterra"
  }
  db_subnet_group_use_name_prefix = false
  subnet_ids = [
    "subnet-0e77c3afedd3113f1",
    "subnet-0ea07acf6c9c0c615"
  ]
  db_subnet_group_tags = {
    "Name" : "${local.identifier_5fc703ad85}-private"
  }
  db_subnet_group_description = "${local.identifier_5fc703ad85}-private"
}
