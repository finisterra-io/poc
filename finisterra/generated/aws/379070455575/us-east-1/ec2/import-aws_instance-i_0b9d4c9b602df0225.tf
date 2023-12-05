import {
  id = "i-0b9d4c9b602df0225"
  to = module.aws_instance-i_0b9d4c9b602df0225.aws_instance.default[0]
}

import {
  id = "/dev/sda1:vol-0a03498195267ac6e:i-0b9d4c9b602df0225"
  to = module.aws_instance-i_0b9d4c9b602df0225.aws_volume_attachment.default["/dev/sda1"]
}

import {
  id = "vol-0a03498195267ac6e"
  to = module.aws_instance-i_0b9d4c9b602df0225.aws_ebs_volume.default["/dev/sda1"]
}

