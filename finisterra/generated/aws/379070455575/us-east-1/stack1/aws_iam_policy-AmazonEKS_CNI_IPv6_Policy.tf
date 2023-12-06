locals {
  policy_name_6590e45664 = "AmazonEKS_CNI_IPv6_Policy"
}

module "aws_iam_policy-AmazonEKS_CNI_IPv6_Policy" {
  source           = "github.com/finisterra-io/terraform-aws-iam//modules/iam_policy?ref=main"
  policy_documents = <<EOF
{
    "Statement": [
        {
            "Action": [
                "ec2:AssignIpv6Addresses",
                "ec2:DescribeInstances",
                "ec2:DescribeTags",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeInstanceTypes"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:CreateTags"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:${local.aws_partition}:ec2:*:*:network-interface/*"
            ]
        }
    ],
    "Version": "2012-10-17"
}
EOF

  policy_name = local.policy_name_6590e45664
  path        = "/"
}
