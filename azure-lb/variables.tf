variable "create_lb" {
  description = "Controls if the Azure Load Balancer should be created"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the Azure Load Balancer"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the Load Balancer"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "internal" {
  description = "True for Internal Load Balancer, false for Public"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "Subnet ID for internal load balancer frontend"
  type        = string
  default     = null
}

variable "frontend_port" {
  description = "Frontend port for load balancer rule"
  type        = number
  default     = 443
}

variable "backend_port" {
  description = "Backend port for load balancer rule"
  type        = number
  default     = 8000
}

variable "probe_path" {
  description = "HTTP probe path (only for HTTP probes)"
  type        = string
  default     = "/"
}

variable "probe_interval" {
  description = "Time in seconds between health probes"
  type        = number
  default     = 30
}

variable "healthy_threshold" {
  description = "Number of successful probes for healthy state"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Number of failed probes before marking unhealthy"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags to apply to Azure Load Balancer"
  type        = map(string)
  default     = {}
}
