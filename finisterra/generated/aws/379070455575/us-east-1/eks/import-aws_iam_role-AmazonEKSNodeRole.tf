import {
  id = "AmazonEKSNodeRole"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_role.default[0]
}

import {
  id = "AmazonEKSNodeRole/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_role_policy_attachment.managed["AmazonEKSNodeRole_AmazonEC2ContainerRegistryReadOnly"]
}

import {
  id = "AmazonEKSNodeRole/arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_role_policy_attachment.managed["AmazonEKSNodeRole_AmazonEKSWorkerNodePolicy"]
}

import {
  id = "AmazonEKSNodeRole/arn:aws:iam::379070455575:policy/AmazonEKS_CNI_IPv6_Policy"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_role_policy_attachment.managed["AmazonEKSNodeRole_AmazonEKS_CNI_IPv6_Policy"]
}

import {
  id = "AmazonEKSNodeRole/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_role_policy_attachment.managed["AmazonEKSNodeRole_AmazonEKS_CNI_Policy"]
}

import {
  id = "eks-38c61dc0-cc41-8e42-cdd0-8692e2bedb55"
  to = module.aws_iam_role-AmazonEKSNodeRole.aws_iam_instance_profile.default["eks-38c61dc0-cc41-8e42-cdd0-8692e2bedb55"]
}

