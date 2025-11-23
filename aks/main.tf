provider "azurerm" {
  subscription_id = var.subscription_id 
features {}
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}
resource "azurerm_kubernetes_cluster" "cluster" {
  name                     = "${var.client}-${var.environment}-Akscluster"
  kubernetes_version       = var.kubernetes_version                      
  location                 = var.location    
  resource_group_name      = var.resource_group_name
  private_cluster_enabled  = var.private_cluster_enabled
  dns_prefix               = "tf"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

   network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.dns_service_ip         
    docker_bridge_cidr = var.docker_bridge_cidr
    pod_cidr           = var.pod_cidr              
    service_cidr       = var.service_cidr
  }

  tags = {
      Name = "${var.client}-${var.environment}"
      Environment = var.environment
   }
}
