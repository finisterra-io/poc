locals {
  bucket_a6570aa3d7 = "finisterra-aws-connect"
}

module "aws_s3_bucket-finisterra-aws-connect_a6570aa3d7" {
  source               = "github.com/finisterra-io/terraform-aws-s3-bucket.git?ref=main"
  attach_public_policy = true
  bucket               = local.bucket_a6570aa3d7
  versioning = {
    "status" : "Enabled"
  }
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
  block_public_acls        = false
  block_public_policy      = false
  ignore_public_acls       = false
  restrict_public_buckets  = false
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"
}
