import {
  id = "a72d4304-4f25-4504-8c06-e0f6de813dc6"
  to = module.aws_kms_key-a72d4304_4f25_4504_8c06_e0f6de813dc6.aws_kms_key.this[0]
}

import {
  id = "alias/eks"
  to = module.aws_kms_key-a72d4304_4f25_4504_8c06_e0f6de813dc6.aws_kms_alias.this["alias/eks"]
}

import {
  id = "arn:aws:kms:us-east-1:379070455575:key/a72d4304-4f25-4504-8c06-e0f6de813dc6:8fa278b59b24a9f733758bf4e674510db744c87053e442dfecc25d4f852fefd0"
  to = module.aws_kms_key-a72d4304_4f25_4504_8c06_e0f6de813dc6.aws_kms_grant.this["arn:aws:kms:us-east-1:379070455575:key/a72d4304-4f25-4504-8c06-e0f6de813dc6:8fa278b59b24a9f733758bf4e674510db744c87053e442dfecc25d4f852fefd0"]
}

