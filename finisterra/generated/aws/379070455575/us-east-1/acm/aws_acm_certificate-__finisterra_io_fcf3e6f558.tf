locals {
  domain_name_fcf3e6f558 = "*.finisterra.io"
}

module "aws_acm_certificate-__finisterra_io_fcf3e6f558" {
  source                 = "github.com/finisterra-io/terraform-aws-acm.git?ref=main"
  create_certificate     = true
  validate_certificate   = false
  wait_for_validation    = false
  create_route53_records = false
  domain_name            = local.domain_name_fcf3e6f558
  subject_alternative_names = [
    local.domain_name_fcf3e6f558
  ]
  key_algorithm = "RSA_2048"
}
