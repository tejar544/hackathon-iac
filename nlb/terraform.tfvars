

name                        = ""
security_groups             = ["sg-0156ed7bb51283baa"]
subnets                     = []
internal                    = false
cross_zone_load_balancing   = true
idle_timeout                = 400
connection_draining         = true
connection_draining_timeout = 400
access_logs                 = {}
instances                   = []
availability_zones          = ["us-east-1a"]
instance                    = "i-023fa3e78874688de"

instance_port      =  8000
instance_protocol  = "http"
lb_port            = 443
lb_protocol        = "http"

 healthy_threshold   = 2
unhealthy_threshold = 2
timeout             = 3
target              = "HTTP:8000/"
interval            = 30