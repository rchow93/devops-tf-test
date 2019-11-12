#Variable definitions - passed from calling module#####
#######################################################
variable "cidr_block" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}
variable "region" {}
variable "env" {}
variable "app" {}


variable "my_ips" {
  default = []
}

variable "public_subnet_cidr_blocks" {
  default = []
}

variable "private_subnet_cidr_blocks" {
  default = []
}

variable "dmz_subnet_cidr_blocks" {
  default = []
}

variable "vpn_subnet_cidr_blocks" {
  default = []
}

variable "app_subnet_cidr_blocks" {
  default = []
}

variable "db_subnet_cidr_blocks" {
  default = []
}

variable "availability_zones" {
  default = []
}

variable "bastion-instance-type" {
  default = "t2.micro"
}

variable "prod-packer-ssh" {}

variable "kubernetes-name" {
  default = "ourdevops.com"
}
