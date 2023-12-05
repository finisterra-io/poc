import {
  id = "ft-scheduler"
  to = module.aws_ecr_repository-ft-scheduler.aws_ecr_repository.this[0]
}

import {
  id = "ft-scheduler"
  to = module.aws_ecr_repository-ft-scheduler.aws_ecr_lifecycle_policy.this[0]
}

import {
  id = "ft-scheduler"
  to = module.aws_ecr_repository-ft-scheduler.aws_ecr_registry_scanning_configuration.this[0]
}

