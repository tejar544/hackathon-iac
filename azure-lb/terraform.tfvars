name                = "continuum-lb"

resource_group_name = "prod-rg"
location            = "eastus"

subnet_id           = "/subscriptions/xxxx/resourceGroups/prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/app-subnet"

internal            = false

frontend_port       = 443
backend_port        = 8000

probe_path          = "/"
probe_interval      = 30
healthy_threshold   = 2
unhealthy_threshold = 2
