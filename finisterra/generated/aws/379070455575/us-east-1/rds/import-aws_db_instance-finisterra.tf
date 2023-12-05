import {
  id = "finisterra"
  to = module.aws_db_instance-finisterra.module.db_instance.aws_db_instance.this[0]
}

import {
  id = "finisterra-private"
  to = module.aws_db_instance-finisterra.module.db_subnet_group.aws_db_subnet_group.this[0]
}

