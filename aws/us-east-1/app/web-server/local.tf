#this is a placeholder for storing local variables that could be used for consistent naming and other conventions.
locals {
  name = "${var.region}-${var.env}-${var.app}"
  common_tags = {
    Environment = "${var.env}"
    Region      = "${var.region}"
    App         = "${var.app}"
  }
}
