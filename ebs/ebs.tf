resource "azurerm_managed_disk" "disk" {
  name                 = "${var.client}-data-disk"
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = data.azurerm_resource_group.rg.name

  storage_account_type = var.disk_type
  create_option        = var.snapshot_id != "" ? "Import" : "Empty"

  disk_size_gb         = var.size

  # IOPS only applies to premium types
  disk_iops_read_write = var.disk_type == "Premium_P1" ? var.iops : null

  # Encryption
  disk_encryption_set_id = var.kms_key_id != "" ? var.kms_key_id : null

  tags = {
    Name = "${var.client}-disk"
  }
}
