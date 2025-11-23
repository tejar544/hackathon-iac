variable "client" {
  description = "Name prefix for Azure resources"
  type        = string
}

variable "disk_size_gb" {
  description = "Azure disk size in GB"
  type        = number
}

variable "disk_type" {
  description = "Azure managed disk type"
  type        = string
  default     = "Standard_LRS"
  # valid Azure options:
  # Standard_LRS
  # StandardSSD_LRS
  # Premium_LRS
  # UltraSSD_LRS
}

variable "disk_iops" {
  description = "IOPS (only for Premium/Ultra disks)"
  type        = number
  default     = null
}

variable "source_resource_id" {
  description = "Snapshot or disk ID (Azure import)"
  type        = string
  default     = null
}

variable "disk_encryption_set_id" {
  description = "Azure CMK encryption (Disk Encryption Set)"
  type        = string
  default     = null
}
