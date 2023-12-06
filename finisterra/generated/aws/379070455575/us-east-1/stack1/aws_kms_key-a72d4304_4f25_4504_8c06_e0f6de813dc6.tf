module "aws_kms_key-a72d4304_4f25_4504_8c06_e0f6de813dc6" {
  source                   = "github.com/finisterra-io/terraform-aws-kms?ref=main"
  create_external          = false
  create_replica           = false
  create_replica_external  = false
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = false
  is_enabled               = true
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = false
  policy                   = <<EOF
{
    "Id": "key-consolepolicy-3",
    "Statement": [
        {
            "Action": "kms:*",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
            },
            "Resource": "*",
            "Sid": "Enable IAM User Permissions"
        },
        {
            "Action": [
                "kms:Create*",
                "kms:Describe*",
                "kms:Enable*",
                "kms:List*",
                "kms:Put*",
                "kms:Update*",
                "kms:Revoke*",
                "kms:Disable*",
                "kms:Get*",
                "kms:Delete*",
                "kms:TagResource",
                "kms:UntagResource",
                "kms:ScheduleKeyDeletion",
                "kms:CancelKeyDeletion"
            ],
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/eksClusterRole",
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:user/daniel"
                ]
            },
            "Resource": "*",
            "Sid": "Allow access for Key Administrators"
        },
        {
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/eksClusterRole",
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:user/daniel"
                ]
            },
            "Resource": "*",
            "Sid": "Allow use of the key"
        },
        {
            "Action": [
                "kms:CreateGrant",
                "kms:ListGrants",
                "kms:RevokeGrant"
            ],
            "Condition": {
                "Bool": {
                    "kms:GrantIsForAWSResource": "true"
                }
            },
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/eksClusterRole",
                    "arn:${local.aws_partition}:iam::${local.aws_account_id}:user/daniel"
                ]
            },
            "Resource": "*",
            "Sid": "Allow attachment of persistent resources"
        }
    ],
    "Version": "2012-10-17"
}
EOF

  aliases = [
    "alias/eks"
  ]
  grants = {
    "arn:${local.aws_partition}:kms:${local.aws_region}:${local.aws_account_id}:key/a72d4304-4f25-4504-8c06-e0f6de813dc6:8fa278b59b24a9f733758bf4e674510db744c87053e442dfecc25d4f852fefd0" : {
      "name" : "eks-grant-finisterra",
      "grantee_principal" : "eks.${local.aws_region}.amazonaws.com",
      "operations" : [
        "Decrypt",
        "Encrypt"
      ],
      "constraints" : [
        {
          "encryption_context_equals" : {
            "aws:eks:context" : "a9a8a022-aaf2-4ee0-aa14-f41a94497cfe"
          },
          "encryption_context_subset" : {}
        }
      ],
      "retiring_principal" : "eks.${local.aws_region}.amazonaws.com",
      "grant_creation_tokens" : null,
      "retire_on_delete" : null
    }
  }
}
