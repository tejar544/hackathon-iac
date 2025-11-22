
variable "egressrules" {
    type = list(number)
    default = [ 0,443,25 ]
}
variable "ingressrules" {
  type = list(number)
    default = [ 0,443 ]

}
variable "security_groups" {
  
}
variable "aws_region" {
  
}
variable "name" {
  
}
variable "vpc-filter-tag" {
  
}