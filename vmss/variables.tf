variable "resource_group_name" {}
variable "vnet_name" {}
variable "subnet_name" {}

variable "client" {}
variable "environment" {}

variable "vm_size" {
  default = "Standard_DS1_v2"
}

variable "desired_capacity" {
  type = number
}

variable "admin_username" {
  default = "azureuser"
}

variable "ssh_public_key" {}

variable "image_publisher" {
  default = "Canonical"
}

variable "image_offer" {
  default = "UbuntuServer"
}

variable "image_sku" {
  default = "18.04-LTS"
}

variable "image_version" {
  default = "latest"
}

variable "os_disk_type" {
  default = "Standard_LRS"
}

variable "upgrade_mode" {
  default = "Manual"
}

variable "name_tag" {
  default = "fayh"
}
