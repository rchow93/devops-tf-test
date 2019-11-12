# Create a new VPC
resource "aws_vpc" "new_vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}"
    )
  )}"
}

