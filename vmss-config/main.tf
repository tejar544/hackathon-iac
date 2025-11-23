resource "azurerm_public_ip" "lb_pip" {
  count               = var.internal ? 0 : 1
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "this" {
  count               = var.create_lb ? 1 : 0
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name = "frontend-config"

    public_ip_address_id = var.internal ? null : azurerm_public_ip.lb_pip[0].id
    subnet_id            = var.internal ? var.subnet_id : null
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend" {
  count               = var.create_lb ? 1 : 0
  name                = "${var.name}-backend-pool"
  loadbalancer_id     = azurerm_lb.this[0].id
}

resource "azurerm_lb_probe" "http_probe" {
  count               = var.create_lb ? 1 : 0
  name                = "${var.name}-probe"
  loadbalancer_id     = azurerm_lb.this[0].id
  protocol            = "Http"
  request_path        = var.probe_path
  port                = var.backend_port
  interval_in_seconds = var.probe_interval
  number_of_probes    = var.unhealthy_threshold
}

resource "azurerm_lb_rule" "lb_rule" {
  count                          = var.create_lb ? 1 : 0
  name                           = "${var.name}-rule"
  loadbalancer_id                = azurerm_lb.this[0].id
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "frontend-config"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend[0].id
  probe_id                       = azurerm_lb_probe.http_probe[0].id
}
