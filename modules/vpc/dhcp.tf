resource "aws_vpc_dhcp_options" "dhcp-tftest" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-dhcp-options"
    )
  )}"
}

resource "aws_vpc_dhcp_options_association" "dhcp-association-tftest" {
  vpc_id          = "${aws_vpc.new_vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp-tftest.id}"
}
