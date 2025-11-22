
variable  "availability_zone"{
    type = string
}
variable "size" {
    type = number
}
variable "encrypted"{
    type = bool
}
variable "iops"{
    
    type = number 
}
variable "multi_attach_enabled" {
    type =bool
}
 variable "snapshot_id"{
     type = string
 }
 variable "outpost_arn"{
     type = string
 }
 variable "type"{
     type = string
 }
 variable "kms_key_id"{
     type = string
 }
