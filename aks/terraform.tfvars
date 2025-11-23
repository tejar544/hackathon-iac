

client                    = "techforce"
environment               = "dev"
subscription_id           = "709a4f58-01ab-4aef-a5d8-97ad76b668d3"
kubernetes_version        = "1.19.11"
location                  = "East US"
resource_group_name       = "Em_Console_Test"
private_cluster_enabled   = false

network_plugin            = "kubenet"
pod_cidr                  = "10.244.0.0/16"
service_cidr              = "10.0.0.0/16"
dns_service_ip            = "10.0.0.10"
docker_bridge_cidr        = "172.17.0.1/16"

