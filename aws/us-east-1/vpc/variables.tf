variable "region" {
  description = "The AWS Region"
}

variable "ssh-key-dev" {
  description = "This is the ssh-key"
}

variable "env" {
  description = "The environment"
}

variable "cidr_block" {}

variable "enable_dns_support" {
  description = "Enable DNS Support on the VPC"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Support on the VPC"
}

variable "availability_zones" {
  description = "Availability Zone"
  default     = []
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR Blocks for the Public IP Space"
  default     = []
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR Blocks for the Private IP Space"
  default     = []
}

variable "dmz_subnet_cidr_blocks" {
  description = "The CIDR Blocks for the DMZ IP Space"
  default     = []
}

variable "vpn_subnet_cidr_blocks" {
  description = "The CIDR Blocks for the VPN IP Space"
  default     = []
}

variable "app_subnet_cidr_blocks" {
  description = "CIDR for app space"
  default     = []
}

variable "db_subnet_cidr_blocks" {
  description = "CIDR for db space"
  default     = []
}

variable "enable_ver" {
  description = "Enable versioning on the bucket"
}

variable "my_ips" {
  description = "My IP"
  default     = []
}

variable "app" {
  description = "App"
}

variable "bastion-instance-type" {
  description = "This is the default instance type for the bastion/nat instance"
  default = "t2.micro"
}

variable "kubernetes-name" {
  description = "This is the name of the kubernetes cluster"
}


