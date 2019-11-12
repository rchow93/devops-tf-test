# Network ACL
#1. Create ACL for Private Subnet
resource "aws_network_acl" "private" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-private-subnet.*.id)}"]
  
  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-private-acl"
    )
  )}"


}


# Network ACL
#2.Create ACL for App Subnet
resource "aws_network_acl" "App" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-app-subnet.*.id)}"]

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-app-acl"
    )
  )}"


}

# Network ACL
#3.Create ACL for DB Subnet
resource "aws_network_acl" "DB" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-db-subnet.*.id)}"]

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-db-acl"
    )
  )}"
}

# Network ACL
#4. Create ACL for Public Subnet
resource "aws_network_acl" "Public" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-public-subnet.*.id)}"]

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-public-acl"
    )
  )}"
}

# Network ACL
#5. Create ACL for DMZ Subnet
resource "aws_network_acl" "dmz" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-dmz-subnet.*.id)}"]

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-dmz-acl"
    )
  )}"
}

# Network ACL
#6.Create ACL for VPN subnet
resource "aws_network_acl" "vpn" {
  vpc_id     = "${aws_vpc.new_vpc.id}"
  subnet_ids = ["${concat(aws_subnet.VPC-vpn-subnet.*.id)}"]

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-vpn-acl"
    )
  )}"
}
