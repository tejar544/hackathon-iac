variable "client" {}

variable "size" {
  type = number
}

variable "disk_type" {
  description = "Equivalent to EBS volume type"
  default     = "Standard_LRS" # options: Premium_LRS, StandardSSD_LRS
}

variable "iops" {
  type    = number
  default = 0
}

variable "snapshot_id" {
  default = ""
}

variable "kms_key_id" {
  default = ""
}
