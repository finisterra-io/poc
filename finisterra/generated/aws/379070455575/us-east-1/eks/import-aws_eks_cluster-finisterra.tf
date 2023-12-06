import {
  id = "finisterra"
  to = module.aws_eks_cluster-finisterra.aws_eks_cluster.this[0]
}

import {
  id = "finisterra:aws-ebs-csi-driver"
  to = module.aws_eks_cluster-finisterra.aws_eks_addon.this["aws-ebs-csi-driver"]
}

import {
  id = "finisterra:coredns"
  to = module.aws_eks_cluster-finisterra.aws_eks_addon.this["coredns"]
}

import {
  id = "finisterra:kube-proxy"
  to = module.aws_eks_cluster-finisterra.aws_eks_addon.this["kube-proxy"]
}

import {
  id = "finisterra:vpc-cni"
  to = module.aws_eks_cluster-finisterra.aws_eks_addon.this["vpc-cni"]
}

import {
  id = "sg-002f0bf29b8191c24,aws:eks:cluster-name"
  to = module.aws_eks_cluster-finisterra.aws_ec2_tag.cluster_primary_security_group["aws:eks:cluster-name"]
}

import {
  id = "sg-002f0bf29b8191c24,kubernetes.io/cluster/finisterra"
  to = module.aws_eks_cluster-finisterra.aws_ec2_tag.cluster_primary_security_group["kubernetes.io/cluster/finisterra"]
}

import {
  id = "arn:aws:iam::379070455575:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/EB4C3AA33D4CD6290A35398261EC61B8"
  to = module.aws_eks_cluster-finisterra.aws_iam_openid_connect_provider.oidc_provider[0]
}

import {
  id = "finisterra:ft1"
  to = module.aws_eks_cluster-finisterra.module.eks_managed_node_group["ft1"].aws_eks_node_group.this[0]
}

