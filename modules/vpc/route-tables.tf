
#Create the route tables
###################################################################################
# Create a new public route table
resource "aws_route_table" "VPC-public-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc-igw.id}"
  }

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-public-rt",
      "SubnetType", "Public",
      "kubernetes.io/kops/role", "public"
    )
  )}"
}

#create route table for vpn
resource "aws_route_table" "VPC-vpn-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc-igw.id}"
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-vpn-rt",
      "SubnetType", "Public",
      "kubernetes.io/kops/role", "public"
    )
  )}"
}

# Create a new private route table
resource "aws_route_table" "VPC-private-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.vpc-natgw.id}"
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-private-rt",
      "SubnetType", "Private",
      "kubernetes.io/kops/role", "private"
    )
  )}"
}


#create route table for dmz
resource "aws_route_table" "VPC-dmz-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc-igw.id}"
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-dmz-rt",
      "SubnetType", "Public",
      "kubernetes.io/kops/role", "public"
    )
  )}"
}

# Create a new db route table
resource "aws_route_table" "VPC-db-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.vpc-natgw.id}"
}

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-db-rt",
      "SubnetType", "Private",
      "kubernetes.io/kops/role", "private"
    )
  )}"
}

#create route table for app
resource "aws_route_table" "VPC-app-rtb" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.vpc-natgw.id}"
}

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-app-rt",
      "SubnetType", "Private",
      "kubernetes.io/kops/role", "private"
    )
  )}"
}


##########################################################################
#Associate new route tables with subnets
##########################################################################
resource "aws_route_table_association" "public_subnet" {
  count = "${length(var.public_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-public-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-public-rtb.id}"
}

resource "aws_route_table_association" "dmz_subnet" {
  count = "${length(var.dmz_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-dmz-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-dmz-rtb.id}"
}

resource "aws_route_table_association" "private_subnet" {
  count = "${length(var.private_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-private-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-private-rtb.id}"
}

resource "aws_route_table_association" "vpn_subnet" {
  count = "${length(var.vpn_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-vpn-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-vpn-rtb.id}"
}

resource "aws_route_table_association" "db_subnet" {
  count = "${length(var.db_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-db-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-db-rtb.id}"
}

resource "aws_route_table_association" "app_subnet" {
  count = "${length(var.app_subnet_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.VPC-app-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.VPC-app-rtb.id}"
}




