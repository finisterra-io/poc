locals {
  cluster_name_5fc703ad85 = "finisterra"
}

module "aws_eks_cluster-finisterra" {
  source                        = "github.com/finisterra-io/terraform-aws-eks.git?ref=main"
  create_cluster_security_group = false
  create_node_security_group    = false
  cluster_name                  = local.cluster_name_5fc703ad85
  iam_role_arn                  = "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/eksClusterRole"
  cluster_version               = "1.28"
  subnet_ids = [
    "subnet-0e77c3afedd3113f1",
    "subnet-0ea07acf6c9c0c615"
  ]
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_endpoint_public_access_cidrs = [
    "0.0.0.0/0"
  ]
  cluster_encryption_config = {
    "provider" : [
      {
        "key_arn" : "arn:${local.aws_partition}:kms:${local.aws_region}:${local.aws_account_id}:key/a72d4304-4f25-4504-8c06-e0f6de813dc6"
      }
    ],
    "resources" : [
      "secrets"
    ]
  }
  cluster_tags = {
    "alpha.eksctl.io/cluster-oidc-enabled" : "true"
  }
  cluster_ip_family         = "ipv4"
  cluster_service_ipv4_cidr = "172.20.0.0/16"
  cluster_addons = {
    "aws-ebs-csi-driver" : {
      "name" : "aws-ebs-csi-driver",
      "addon_version" : "v1.19.0-eksbuild.2",
      "configuration_values" : "",
      "service_account_role_arn" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/AmazonEKS_EBS_CSI_DriverRole",
      "tags" : {}
    },
    "coredns" : {
      "name" : "coredns",
      "addon_version" : "v1.10.1-eksbuild.1",
      "configuration_values" : "",
      "service_account_role_arn" : "",
      "tags" : {}
    },
    "kube-proxy" : {
      "name" : "kube-proxy",
      "addon_version" : "v1.27.1-eksbuild.1",
      "configuration_values" : "",
      "service_account_role_arn" : "",
      "tags" : {}
    },
    "vpc-cni" : {
      "name" : "vpc-cni",
      "addon_version" : "v1.12.6-eksbuild.2",
      "configuration_values" : "",
      "service_account_role_arn" : "",
      "tags" : {}
    }
  }
  ec2_tags = {
    "aws:eks:cluster-name" : local.cluster_name_5fc703ad85,
    "kubernetes.io/cluster/${local.cluster_name_5fc703ad85}" : "owned"
  }
  oidc_provider_tags = {
    "alpha.eksctl.io/cluster-name" : local.cluster_name_5fc703ad85,
    "alpha.eksctl.io/eksctl-version" : "0.114.0-dev+48660cbd1.2022-10-08T02:21:31Z"
  }
  custom_oidc_thumbprints = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
  ]
  eks_managed_node_groups = {
    "ft2" : {
      "use_name_prefix" : false,
      "subnet_ids" : [
        "subnet-0e77c3afedd3113f1",
        "subnet-0ea07acf6c9c0c615"
      ],
      "min_size" : 1,
      "max_size" : 1,
      "desired_size" : 1,
      "ami_type" : "AL2_x86_64",
      "capacity_type" : "ON_DEMAND",
      "disk_size" : 20,
      "instance_types" : [
        "t3.medium"
      ],
      "labels" : {},
      "taints" : [],
      "iam_role_arn" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:role/AmazonEKSNodeRole",
      "update_config" : {
        "max_unavailable" : 1
      }
    }
  }
}
