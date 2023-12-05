locals {
  name_f7ddf37019 = "project-vpc"
}

module "aws_vpc-project-vpc" {
  source                               = "github.com/finisterra-io/terraform-aws-vpc.git?ref=main"
  create_igw                           = true
  name                                 = local.name_f7ddf37019
  cidr                                 = "10.0.0.0/16"
  enable_network_address_usage_metrics = false
  tags = {
    "Name" : local.name_f7ddf37019
  }
  manage_default_route_table = true
  manage_default_network_acl = true
  default_network_acl_egress = [
    {
      "action" : "allow",
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "icmp_code" : "0",
      "icmp_type" : "0",
      "protocol" : "-1",
      "rule_no" : 100,
      "to_port" : 0
    }
  ]
  default_network_acl_ingress = [
    {
      "action" : "allow",
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "icmp_code" : "0",
      "icmp_type" : "0",
      "protocol" : "-1",
      "rule_no" : 100,
      "to_port" : 0
    }
  ]
  manage_default_security_group = true
  default_security_group_egress = [
    {
      "cidr_blocks" : "0.0.0.0/0",
      "description" : "",
      "from_port" : 0,
      "ipv6_cidr_blocks" : "",
      "prefix_list_ids" : "",
      "protocol" : "-1",
      "security_groups" : "",
      "self" : false,
      "to_port" : 0
    }
  ]
  default_security_group_ingress = [
    {
      "cidr_blocks" : "10.0.0.0/16",
      "description" : "",
      "from_port" : 0,
      "ipv6_cidr_blocks" : "",
      "prefix_list_ids" : "",
      "protocol" : "-1",
      "security_groups" : "",
      "self" : true,
      "to_port" : 0
    }
  ]
  private_subnets = {
    "10.0.144.0/20" : {
      "az" : "${local.aws_region}b",
      "ipv6_cidr_block" : "",
      "tags" : {
        "Name" : "project-subnet-private2-${local.aws_region}b",
        "kubernetes.io/cluster/finisterra" : "shared",
        "kubernetes.io/role/internal-elb" : "1"
      },
      "route_tables" : [
        "private_route_table_0"
      ],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : false
    },
    "10.0.128.0/20" : {
      "az" : "${local.aws_region}a",
      "ipv6_cidr_block" : "",
      "tags" : {
        "Name" : "project-subnet-private1-${local.aws_region}a",
        "kubernetes.io/cluster/finisterra" : "shared",
        "kubernetes.io/role/internal-elb" : "1"
      },
      "route_tables" : [
        "private_route_table_1"
      ],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : false
    }
  }
  private_route_tables = {
    "private_route_table_0" : {
      "tags" : {
        "Name" : "project-rtb-private2-${local.aws_region}b"
      },
      "nat_gateway_attached" : "nat_gateway_0"
    },
    "private_route_table_1" : {
      "tags" : {
        "Name" : "project-rtb-private1-${local.aws_region}a"
      },
      "nat_gateway_attached" : "nat_gateway_0"
    }
  }
  public_subnets = {
    "10.0.16.0/20" : {
      "az" : "${local.aws_region}b",
      "ipv6_cidr_block" : "",
      "tags" : {
        "Name" : "project-subnet-public2-${local.aws_region}b",
        "kubernetes.io/cluster/finisterra" : "shared",
        "kubernetes.io/role/elb" : "1"
      },
      "route_tables" : [
        "public_route_table_0"
      ],
      "nat_gateway" : {},
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "map_public_ip_on_launch" : false,
      "private_dns_hostname_type_on_launch" : "ip-name"
    },
    "10.0.0.0/20" : {
      "az" : "${local.aws_region}a",
      "ipv6_cidr_block" : "",
      "tags" : {
        "Name" : "project-subnet-public1-${local.aws_region}a",
        "kubernetes.io/cluster/finisterra" : "shared",
        "kubernetes.io/role/elb" : "1"
      },
      "route_tables" : [
        "public_route_table_0"
      ],
      "nat_gateway" : {
        "nat_gateway_0" : {
          "tags" : {},
          "eip_tags" : {}
        }
      },
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "map_public_ip_on_launch" : false,
      "private_dns_hostname_type_on_launch" : "ip-name"
    }
  }
  public_subnet_enable_dns64                                   = false
  public_subnet_enable_resource_name_dns_aaaa_record_on_launch = false
  map_public_ip_on_launch                                      = false
  public_subnet_private_dns_hostname_type_on_launch            = "ip-name"
  public_route_tables = {
    "public_route_table_0" : {
      "tags" : {
        "Name" : "project-rtb-public"
      }
    }
  }
  enable_nat_gateway = true
  igw_tags = {
    "Name" : "project-igw"
  }
  enable_dhcp_options_association = true
  dhcp_options_domain_name        = "ec2.internal"
  dhcp_options_id                 = "dopt-011eb442d52d8245d"
  create_dhcp_options             = true
  dhcp_options_domain_name_servers = [
    "AmazonProvidedDNS"
  ]
}
