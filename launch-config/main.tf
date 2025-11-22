#data "aws_security_group" "existing" {
  #count  = local.sg_existing ? 1 : 0
  #id     = var.existing_sg_id
  #vpc_id = var.vpc_id
#}
# data "aws_security_groups" "compute-sg" {
#   tags = {
#     name   = "tag:Name"
#     values = "prod"
#   }
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["919482847416"] # Canonical
# }

data "aws_security_groups" "test" {
  tags = var.tags
  #tags = {
    # Name = "fayh-prod-elb-sg"
    # Environment = "prod"
  #}
}
# data "aws_security_groups" "compute-sg" {
#   tags = {
#     Name = "prod"
#   }
# }
#data "aws_security_group" "selected" {
 # id = var.security_group_id
#}
# provider "aws" {
#     profile  = "default"
#     region   = "us-east-1"
# }

# data "aws_vpc" "vpc" {
#   filter {
#     name   = "tag:Name"
#     values = var.vpc-filter-tag
# }
# }

# data "aws_subnet_ids" "subnet_asg" {
#   vpc_id = data.aws_vpc.vpc.id
#   filter {
#     name   = "tag:Name"
#     values = ["*-compute"]
# }
# }

# data "aws_security_groups" "security_sgs" {
#   vpc_id = data.aws_vpc.vpc.id
#   filter {
#     name   = "tag:Name"
#     values = ["*-compute"]
# }
# }



resource "aws_launch_configuration" "as_conf" {
  #for_each = var.create_lc ? [1] : [] 
  name                                  = "${var.client}-${var.environment}-LC"
  image_id                              = "ami-087c17d1fe0178315"
  instance_type                         = "t2.micro"
  iam_instance_profile                  = var.iam_instance_profile
  #vpc_id                                = data.aws_vpc.vpc.id
  key_name                              = var.key_name
  # security_groups                       = data.aws_security_groups.
  security_groups                       = data.aws_security_groups.test.ids
  #compute-sg-filter                    = var.compute-sg-filter
  associate_public_ip_address           = var.associate_public_ip_address
  user_data                             = var.user_data
  #user_data_base64                     = var.user_data_base64
  #enable_monitoring                    = var.enable_monitoring
  #ebs_optimized                        = var.ebs_optimized
  #tag = {
  #   Name = "compute-sg"
  #}

  # dynamic root_block_device {
  #   for_each = var.root_block_device
  #   content {
  #     delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
  #     iops                  = lookup(root_block_device.value, "iops", null)
  #     volume_size           = lookup(root_block_device.value, "volume_size", null)
  #     volume_type           = lookup(root_block_device.value, "volume_type", null)
  #     encrypted             = lookup(root_block_device.value, "encrypted", null)
  #   }
  # }

  # dynamic "ephemeral_block_device" {
  #   for_each                            = var.ephemeral_block_device
  #   content {
  #     device_name                       = ephemeral_block_device.value.device_name
  #     virtual_name                      = ephemeral_block_device.value.virtual_name
  #   }
  # }

#   dynamic ebs_block_device {
#     for_each                            = var.ebs_block_device
#     content {
#       delete_on_termination             = lookup(ebs_block_device.value, "delete_on_termination", null)
#       device_name                       = ebs_block_device.value.device_name
#       encrypted                         = lookup(ebs_block_device.value, "encrypted", null)
#       iops                              = lookup(ebs_block_device.value, "iops", null)
#       #no_device                         = lookup(ebs_block_device.value, "no_device", null)
#       snapshot_id                       = lookup(ebs_block_device.value, "snapshot_id", null)
#       volume_size                       = lookup(ebs_block_device.value, "volume_size", null)
#       volume_type                       = lookup(ebs_block_device.value, "volume_type", null)

#     }
#   }
 }  