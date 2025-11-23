data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_public_ip" "lb_pip" {
  name                = "${var.client}-${var.environment}-lb-pip"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = "${var.client}-${var.environment}-lb"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "backendpool"
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_lb_probe" "probe" {
  name                = "tcp-probe"
  protocol            = "Tcp"
  port                = var.health_probe_port
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = "lb-rule"
  loadbalancer_id                = azurerm_lb.lb.id
  resource_group_name            = data.azurerm_resource_group.rg.name

  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port

  frontend_ip_configuration_name = "PublicFrontend"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  probe_id                       = azurerm_lb_probe.probe.id
}
