module "aws_instance-i_0b9d4c9b602df0225" {
  source                               = "github.com/finisterra-io/terraform-aws-ec2-instance.git?ref=main"
  ami                                  = "ami-053b0d53c279acc90"
  availability_zone                    = "${local.aws_region}b"
  instance_type                        = "t2.xlarge"
  ebs_optimized                        = false
  instance_initiated_shutdown_behavior = "stop"
  ssh_key_pair                         = "finisterra-ec2"
  subnet                               = "subnet-031e7ffd61bf764a7"
  monitoring                           = false
  private_ip                           = "10.0.21.136"
  tenancy                              = "default"
  security_groups = [
    "sg-0e62598a02647627c"
  ]
  root_volume_size                     = 20
  root_iops                            = 100
  root_block_device_encrypted          = false
  metadata_instance_metadata_tags      = "disabled"
  metadata_http_put_response_hop_limit = 1
  metadata_http_tokens                 = "optional"
  burstable_mode                       = "standard"
  tags = {
    "Name" : "bastion"
  }
  device_name_list = {
    "/dev/sda1" : {
      "size" : 20,
      "type" : "gp2"
    }
  }
}
