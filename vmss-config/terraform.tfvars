client                  = ""
environment             = ""

resource_group_name     = ""
location                = ""

vm_size                 = "Standard_B1s"
source_image_id         = ""   # leave empty if using marketplace image

subnet_id               = ""

admin_username          = "azureuser"
ssh_key_path            = "~/.ssh/id_rsa.pub"

os_disk_size_gb         = 8
storage_account_type    = "Standard_LRS"
enable_disk_encryption  = false

tags = {
  client      = ""
  environment = ""
}
