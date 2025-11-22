
data "aws_vpc" "vpc" {
 filter {
    name   = "tag:Environment"
    values = ["prod"]
}
}

data "aws_subnet_ids" "subnet_asg" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["*-compute"]
}
}

# resource "aws_autoscaling_policy" "asg-policy" {
#   name                   = var.asg_policy_name
#   scaling_adjustment     = var.scaling_adjustment
#   adjustment_type        = var.adjustment_type
#   cooldown               = var.cooldown
#   policy_type            = var.policy_type
#   autoscaling_group_name = aws_autoscaling_group.asg.name
# }

resource "aws_autoscaling_group" "asg" {
     #for_each = var.create_asg ? [1] : []

  launch_configuration      = var.launch_configuration
  name                      = "${var.client}-${var.environment}-asg"
  vpc_zone_identifier       = data.aws_subnet_ids.subnet_asg.ids
  #availability_zones        = var.availability_zones
  #load_balancers           = "${module.elb.elb_name}"
  min_size                  = var.min_size
  max_size                  = var.max_size
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  # force_delete              = var.force_delete
  target_group_arns         = var.target_group 
 
   lifecycle {
    create_before_destroy = true
  }
tag {
    key              = "Name"
    value               = "fayh"
    propagate_at_launch = true
  }

}