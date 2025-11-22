#variable "vpc_id" {
 # type        = string
  #default     = ""
  #description = "The ID of the VPC that the instance security group belongs to."
  #sensitive   = true
#}

# variable "lc_name" {
#   description = "Creates a unique name for launch configuration beginning with the specified prefix"
#   type        = string
# }

# variable "image_id" {
#   description = "The EC2 image ID to launch"
#   type        = string
  
# }

variable "instance_type" {
  description = "The size of instance to launch"
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type        = string
}

variable "key_name" {
  description = "The key name that should be used for the instance"
  type        = string
}


#variable "existing_sg_id" {
  #type        = string
  #default     = null
  #description = "Provide existing security group id for updating existing rule"
#}
#variable "enable_security_group" {
  #type        = bool
 # default     = true
  #description = "Enable default Security Group with only Egress traffic allowed."
#}
#variable "security_groups" {
 # description = "A list of security group IDs to assign to the launch configuration"
 # type        = list(string)
#}
#variable "security_group_id" {}

# variable "compute-sg-filter" {}
variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  type        = bool
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  #type        = string
}
# variable "root_block_device" {
#   description = "Customize details about the root block device of the instance. See Block Devices below for details"
#   type        = list(map(string))
# }

# variable "ebs_block_device" {
#   description = "Additional EBS block devices to attach to the instance"
#   type        = list(map(string))
# }

# variable "ephemeral_block_device" {
#   description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
#   type        = list(map(string))
# }
# variable "ebs_device_name" {
#   description = "name of the device"
#   type        = string
# }

# variable "ephemeral_device_name" {
#   description = "name of the device"
#   type        = string
# }

variable "virtual_name" {
  type        = string
}

variable "delete_on_termination" {
  type        = bool
  default     = "true"
}

variable "iops" {
  type        = number
}
# variable "vpc_security_group_ids" {
#   description = " sg group ids"
#   type        = list(string)
#   default     = []
# }
variable "encrypted"{
type = bool
}
variable "volume_size"{
  type = number
}

variable "volume_type"{
  type = string
}
variable "snapshot_id"{
  type = string
}
variable "client"{
  type = string
}
variable "environment"{
  type = string
}
# variable "create_lc" {
#   description = "Controls if Launch Configuration should be created"
#   type        = bool
# }

# variable "vpc_id" {​​​}​​​

# variable "vpc-filter-tag" {​​​}​​​

# variable "aws_security_groups" {
  # description = "A list of security group IDs "
  # type        = list(string)
# }
variable "tags"{
  type = map(string)
  default = {
    Environment = "prod"
  }
}