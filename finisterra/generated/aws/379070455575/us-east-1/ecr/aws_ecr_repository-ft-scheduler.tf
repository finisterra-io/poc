locals {
  repository_name_dab38fbef0 = "ft-scheduler"
}

module "aws_ecr_repository-ft-scheduler" {
  source                                    = "github.com/finisterra-io/terraform-aws-ecr.git?ref=main"
  attach_repository_policy                  = false
  create_lifecycle_policy                   = true
  repository_type                           = "private"
  manage_registry_scanning_configuration    = true
  create_registry_replication_configuration = false
  repository_name                           = local.repository_name_dab38fbef0
  repository_image_tag_mutability           = "MUTABLE"
  repository_encryption_type                = "KMS"
  repository_kms_key                        = "arn:${local.aws_partition}:kms:${local.aws_region}:${local.aws_account_id}:key/c3d51ee5-0679-4f21-99cf-54d88293f296"
  repository_image_scan_on_push             = false
  repository_lifecycle_policy               = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "delete",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 10
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

  registry_scan_type = "BASIC"
}
