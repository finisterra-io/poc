locals {
  name_4492418ddd = "ft-${local.aws_account_id}-${local.aws_region}-tfstate-lock"
}

module "aws_dynamodb_table-ft-379070455575-us-east-1-tfstate-lock" {
  source                                = "github.com/finisterra-io/terraform-aws-dynamodb-table.git?ref=main"
  autoscaling_enabled                   = false
  ignore_changes_global_secondary_index = true
  name                                  = local.name_4492418ddd
  billing_mode                          = "PAY_PER_REQUEST"
  hash_key                              = "LockID"
  read_capacity                         = 0
  write_capacity                        = 0
  stream_enabled                        = false
  table_class                           = "STANDARD"
  deletion_protection_enabled           = false
  ttl_enabled                           = false
  point_in_time_recovery_enabled        = false
  attributes = [
    {
      "name" : "LockID",
      "type" : "S"
    }
  ]
}
