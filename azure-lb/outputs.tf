output "lb_id" {
  description = "The ID of the Azure Load Balancer."
  value       = azurerm_lb.this.id
}

output "lb_frontend_ip" {
  description = "The frontend public IP of the Azure Load Balancer."
  value       = azurerm_public_ip.lb_public_ip.ip_address
}

output "lb_frontend_config_name" {
  description = "Frontend configuration name."
  value       = azurerm_lb.this.frontend_ip_configuration[0].name
}

output "lb_backend_pool_id" {
  description = "Backend address pool ID to attach VMSS or NICs."
  value       = azurerm_lb_backend_address_pool.this.id
}

output "lb_probe_ids" {
  description = "Health probe IDs."
  value       = azurerm_lb_probe.this.*.id
}

output "lb_rule_ids" {
  description = "Load balancing rule IDs."
  value       = azurerm_lb_rule.this.*.id
}

output "public_ip_id" {
  description = "ID of the public IP assigned to the load balancer."
  value       = azurerm_public_ip.lb_public_ip.id
}
