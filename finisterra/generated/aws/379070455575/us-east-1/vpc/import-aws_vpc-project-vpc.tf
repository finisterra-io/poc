import {
  id = "vpc-047aad4ca656e6dc5"
  to = module.aws_vpc-project-vpc.aws_vpc.this[0]
}

import {
  id = "vpc-047aad4ca656e6dc5"
  to = module.aws_vpc-project-vpc.aws_default_route_table.default[0]
}

import {
  id = "acl-063cdaaefd08e10ee"
  to = module.aws_vpc-project-vpc.aws_default_network_acl.this[0]
}

import {
  id = "sg-01bfa99b71a44419b"
  to = module.aws_vpc-project-vpc.aws_default_security_group.this[0]
}

import {
  id = "subnet-0e77c3afedd3113f1"
  to = module.aws_vpc-project-vpc.aws_subnet.private["10.0.144.0/20"]
}

import {
  id = "subnet-0e77c3afedd3113f1/rtb-0b9d62f731ec196bc"
  to = module.aws_vpc-project-vpc.aws_route_table_association.private["10.0.144.0/20-private_route_table_0"]
}

import {
  id = "rtb-0b9d62f731ec196bc"
  to = module.aws_vpc-project-vpc.aws_route_table.private["private_route_table_0"]
}

import {
  id = "subnet-0ea07acf6c9c0c615"
  to = module.aws_vpc-project-vpc.aws_subnet.private["10.0.128.0/20"]
}

import {
  id = "subnet-0ea07acf6c9c0c615/rtb-05977fe7c66b5be0b"
  to = module.aws_vpc-project-vpc.aws_route_table_association.private["10.0.128.0/20-private_route_table_1"]
}

import {
  id = "rtb-05977fe7c66b5be0b"
  to = module.aws_vpc-project-vpc.aws_route_table.private["private_route_table_1"]
}

import {
  id = "subnet-031e7ffd61bf764a7"
  to = module.aws_vpc-project-vpc.aws_subnet.public["10.0.16.0/20"]
}

import {
  id = "subnet-031e7ffd61bf764a7/rtb-080594ef9f6db448f"
  to = module.aws_vpc-project-vpc.aws_route_table_association.public["10.0.16.0/20-public_route_table_0"]
}

import {
  id = "rtb-080594ef9f6db448f"
  to = module.aws_vpc-project-vpc.aws_route_table.public["public_route_table_0"]
}

import {
  id = "subnet-0a66fad36b8749b42"
  to = module.aws_vpc-project-vpc.aws_subnet.public["10.0.0.0/20"]
}

import {
  id = "subnet-0a66fad36b8749b42/rtb-080594ef9f6db448f"
  to = module.aws_vpc-project-vpc.aws_route_table_association.public["10.0.0.0/20-public_route_table_0"]
}

import {
  id = "nat-04a30f710ae11e623"
  to = module.aws_vpc-project-vpc.aws_nat_gateway.this["nat_gateway_0"]
}

import {
  id = "eipalloc-0331368a336564a6f"
  to = module.aws_vpc-project-vpc.aws_eip.nat["nat_gateway_0"]
}

import {
  id = "rtb-05977fe7c66b5be0b_0.0.0.0/0"
  to = module.aws_vpc-project-vpc.aws_route.private_nat_gateway["private_route_table_1-0.0.0.0/0"]
}

import {
  id = "rtb-0b9d62f731ec196bc_0.0.0.0/0"
  to = module.aws_vpc-project-vpc.aws_route.private_nat_gateway["private_route_table_0-0.0.0.0/0"]
}

import {
  id = "igw-0bfc712c9f9b70959"
  to = module.aws_vpc-project-vpc.aws_internet_gateway.this[0]
}

import {
  id = "rtb-080594ef9f6db448f_0.0.0.0/0"
  to = module.aws_vpc-project-vpc.aws_route.public_internet_gateway["public_route_table_0"]
}

import {
  id = "vpc-047aad4ca656e6dc5"
  to = module.aws_vpc-project-vpc.aws_vpc_dhcp_options_association.this[0]
}

import {
  id = "dopt-011eb442d52d8245d"
  to = module.aws_vpc-project-vpc.aws_vpc_dhcp_options.this[0]
}

