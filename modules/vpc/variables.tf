variable "subnet-list" {
  type    = "list"
  default = ["dmz", "vpn", "private", "public", "app", "db"]
}
