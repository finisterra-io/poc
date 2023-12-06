locals {
  role_name_c760b3ba8d = "AmazonEKSNodeRole"
}

module "aws_iam_role-AmazonEKSNodeRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=main"
  role_name          = local.role_name_c760b3ba8d
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = [
    "arn:${local.aws_partition}:iam::${local.aws_account_id}:policy/AmazonEKS_CNI_IPv6_Policy",
    "arn:${local.aws_partition}:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:${local.aws_partition}:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:${local.aws_partition}:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]
  instance_profiles = [
    {
      "name" : "eks-a0c61e4a-8002-54fa-ad66-42217399ad68",
      "tags" : {}
    }
  ]
}
