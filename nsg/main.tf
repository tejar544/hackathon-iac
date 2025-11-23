provider "azurerm" {
  features {}
}

# ----------------------------
# Variables
# ----------------------------
variable "resource_group_name" {
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  default     = "myVNet"
}

variable "subnet_name" {
  type        = string
  default     = "mySubnet"
}

variable "nsg_name" {
  type        = string
  default     = "myNSG"
}

variable "ingressrules" {
  type    = list(number)
  default = [22, 80, 443]  # Example ports
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443]      # Example outbound ports
}

# ----------------------------
# Resource Group
# ----------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ----------------------------
# Virtual Network
# ----------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ----------------------------
# Subnet
# ----------------------------
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ----------------------------
# Network Security Group
# ----------------------------
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.ingressrules
    content {
      name                       = "Allow-Inbound-${security_rule.value}"
      priority                   = 100 + security_rule.value
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  dynamic "security_rule" {
    for_each = var.egressrules
    content {
      name                       = "Allow-Outbound-${security_rule.value}"
      priority                   = 200 + security_rule.value
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

# ----------------------------
# Associate NSG with Subnet
# ----------------------------
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
