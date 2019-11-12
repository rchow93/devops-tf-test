variable "region" {
  description = "The AWS Region"
}

variable "ssh-key-dev" {
  description = "This is the ssh-key"
}

variable "env" {
  description = "The environment"
}

variable "availability_zones" {
  description = "Availability Zone"
  default     = []
}

variable "my_ips" {
  description = "My IP"
  default     = []
}

variable "app" {
  description = "App"
}

variable "web-instance-type" {
  description = "This is the default instance type for the web server instance"
  default = "t2.micro"
}

variable "min-instances" {
  description = "This is the default min number of instances"
  default = "1"
}

variable "max-instances" {
  description = "This is the default max number of instances"
  default = "1"
}

variable "desired-instances" {
  description = "This is the desired number of instances"
  default = "1"
}

