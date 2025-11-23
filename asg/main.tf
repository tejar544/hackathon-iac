data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "${var.client}-${var.environment}-vmss"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  sku                 = var.vm_size
  instances           = var.desired_capacity   # replaces ASG desired_capacity

  admin_username      = "azureuser"

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "${var.client}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = data.azurerm_subnet.subnet.id
      primary   = true
    }
  }

  upgrade_policy_mode = "Manual"

  tags = {
    Environment = var.environment
    Name        = "fayh"
  }
}
