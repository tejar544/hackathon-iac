# ----------------------------
# Inbound (Ingress) NSG Rules
# ----------------------------
variable "ingressrules" {
  type    = list(number)
  default = [0, 443]   # 0 means allow all ports, 443 is HTTPS
}

# ----------------------------
# Outbound (Egress) NSG Rules
# ----------------------------
variable "egressrules" {
  type    = list(number)
  default = [0, 443, 25]  # 0 = all, 443 = HTTPS, 25 = SMTP
}

# ----------------------------
# NSG Name
# ----------------------------
variable "name" {
  type    = string
  default = "myNSG"
}

# ----------------------------
# Azure Location / Region
# ----------------------------
variable "azure_region" {
  type    = string
  default = "eastus"
}

# ----------------------------
# Resource Group
# ----------------------------
variable "resource_group_name" {
  type    = string
  default = "myResourceGroup"
}

# ----------------------------
# Virtual Network / Subnet Filter
# ----------------------------
variable "vnet_name" {
  type    = string
  default = "myVNet"
}

variable "subnet_name" {
  type    = string
  default = "mySubnet"
}

# ----------------------------
# Security Groups Toggle
# ----------------------------
variable "security_groups" {
  type    = bool
  default = true
}
