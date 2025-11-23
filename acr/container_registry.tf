provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  type    = string
  default = "fayh-prod-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "acr_name" {
  type    = string
  default = "fayhprodacr"
}

variable "sku" {
  type    = string
  default = "Standard"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = var.sku
  admin_enabled            = true

  tags = {
    Environment = "prod"
    Project     = "fayh"
  }
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
