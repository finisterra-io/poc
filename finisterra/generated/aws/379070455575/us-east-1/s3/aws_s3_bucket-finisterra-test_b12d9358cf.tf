locals {
  bucket_b12d9358cf = "finisterra-test"
}

module "aws_s3_bucket-finisterra-test_b12d9358cf" {
  source               = "github.com/finisterra-io/terraform-aws-s3-bucket.git?ref=main"
  attach_public_policy = true
  bucket               = local.bucket_b12d9358cf
  server_side_encryption_configuration = {
    "rule" : {
      "apply_server_side_encryption_by_default" : {
        "kms_master_key_id" : "",
        "sse_algorithm" : "AES256"
      },
      "bucket_key_enabled" : true
    }
  }
  request_payer            = "BucketOwner"
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"
}
