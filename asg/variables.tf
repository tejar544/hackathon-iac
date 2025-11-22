
variable "launch_configuration"{
  type = string
}
# # variable "availability_zones" {
# #   description = "availability zones"
# #   type        = set(string)
# # }

# # variable "load_balancers" {
# #   description = "load_balancer"
# #   type        = string
# # }

#  variable "asg_policy_name"{
#    type = string
#  }
#  variable"scaling_adjustment"{
#    type = number
#  }
#  variable "adjustment_type"{
#    type = string
#  }
# #  variable "cooldown"{
# #    type = number
# #  }
# #  variable "policy_type"{
# #    type = string
# #  }
 
#  variable "name"{
#    type = string
#  }
variable "min_size"{
  type= number
}
variable "max_size"{
  type = number
}
variable "desired_capacity"{
  type = number
}
# # variable"force_delete"{
# #   type = bool
# # }
variable "health_check_type"{
  type = string
}
variable "health_check_grace_period"{
  type = number
}
variable "wait_for_capacity_timeout"{
  type = number
}
# variable "autoscaling_group_name"{
#    type = string
#  }

 variable "target_group"{
   type = set(string)
   default = "test"
 }
 
# # variable "client"{
# #   type = string
# # }
# variable "environment"{
#   type = string
# }
# variable "create_asg" {
#   description = "Controls if ASG should be created"
#   type        = bool
# }

