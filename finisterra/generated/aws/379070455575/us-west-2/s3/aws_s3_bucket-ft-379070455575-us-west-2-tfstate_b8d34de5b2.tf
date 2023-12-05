locals {
  bucket_b8d34de5b2 = "ft-${local.aws_account_id}-${local.aws_region}-tfstate"
}

module "aws_s3_bucket-ft-379070455575-us-west-2-tfstate_b8d34de5b2" {
  source               = "github.com/finisterra-io/terraform-aws-s3-bucket.git?ref=main"
  attach_public_policy = true
  bucket               = local.bucket_b8d34de5b2
  versioning = {
    "status" : "Enabled"
  }
  server_side_encryption_configuration = {
    "rule" : {
      "apply_server_side_encryption_by_default" : {
        "kms_master_key_id" : "arn:${local.aws_partition}:kms:${local.aws_region}:${local.aws_account_id}:alias/aws/s3",
        "sse_algorithm" : "aws:kms"
      },
      "bucket_key_enabled" : false
    }
  }
  request_payer = "BucketOwner"
  attach_policy = true
  policy        = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "EnforcedTLS",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:${local.aws_partition}:s3:::${local.bucket_b8d34de5b2}",
                "arn:${local.aws_partition}:s3:::${local.bucket_b8d34de5b2}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "RootAccess",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:${local.aws_partition}:s3:::${local.bucket_b8d34de5b2}",
                "arn:${local.aws_partition}:s3:::${local.bucket_b8d34de5b2}/*"
            ]
        }
    ]
}
EOF

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
}
