region = "us-east-1"

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

env = "prod"

app = "web-server"

#static entries - same for all regions - this is my ISP IP which is only SSH port open.
my_ips = ["135.180.73.181/32"]

web-instance-type = "t2.micro"

ssh-key-dev ="PLEASE PUT YOUR OWN SSH KEY"
min-instances = "1"

max-instances = "1"

desired-instances = "1"



