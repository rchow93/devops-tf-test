region = "us-east-1"

#please set this ssh-key to yours
ssh-key-dev ="PLEASE PUT YOUR SSH KEY HERE"
cidr_block = "172.168.0.0/20"

vpc_name = "tf-test-prod-vpc"

public_subnet_cidr_blocks = ["172.168.0.0/24", "172.168.1.0/24", "172.168.2.0/24"]

private_subnet_cidr_blocks = ["172.168.3.0/24", "172.168.4.0/24", "172.168.5.0/24"]

dmz_subnet_cidr_blocks = ["172.168.6.0/24", "172.168.7.0/24", "172.168.8.0/24"]

db_subnet_cidr_blocks = ["172.168.9.0/24", "172.168.10.0/24", "172.168.11.0/24"]

app_subnet_cidr_blocks = ["172.168.12.0/24", "172.168.13.0/24", "172.168.14.0/24" ]

vpn_subnet_cidr_blocks = ["172.168.15.0/24"]

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

#vpc variables
enable_dns_support = true

enable_dns_hostnames = true

env = "prod"

app = "vpc"

#static entries - same for all regions - this is my ISP IP which is only SSH port open.
my_ips = ["135.180.73.181/32"]

enable_ver = true

bastion-instance-type = "t2.micro"

kubernetes-name = "tf-test"

