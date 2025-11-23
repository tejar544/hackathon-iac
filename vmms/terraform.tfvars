

resource_group_name = "rg-prod"
vnet_name           = "prod-vnet"
subnet_name         = "prod-subnet"

client      = "fayh"
environment = "prod"

vm_size          = "Standard_DS1_v2"
desired_capacity = 2

ssh_public_key = "~/.ssh/id_rsa.pub"

upgrade_mode = "Automatic"

name_tag = "fayh"
