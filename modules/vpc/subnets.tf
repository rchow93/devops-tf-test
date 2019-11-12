#Create DMZ Subnets
resource "aws_subnet" "VPC-dmz-subnet" {
  count = "${length(var.dmz_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.dmz_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true


  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-dmz-${count.index}",
      "kubernetes.io/role/elb", "1",
      "kubernetes.io/role/alb-ingress", "1",
      "SubnetType", "Utility",
      "App-Type", "DMZ"
    )
  )}"
}


#Create Private Subnets
resource "aws_subnet" "VPC-private-subnet" {
  count = "${length(var.private_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.private_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = false

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-private-${count.index}",
      "kubernetes.io/role/internal-elb", "1",
      "SubnetType", "Private",
      "App-Type", "Private"
    )
  )}"
}


#Create Public Subnets
resource "aws_subnet" "VPC-public-subnet" {
  count = "${length(var.public_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.public_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-public-${count.index}",
      "kubernetes.io/role/elb", "1",
      "kubernetes.io/role/alb-ingress", "1",
      "SubnetType", "Utility",
      "App-Type", "Public"
    )
  )}"
}

#Create DB Subnets
resource "aws_subnet" "VPC-db-subnet" {
  count = "${length(var.db_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.db_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = false

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-db-${count.index}",
      "kubernetes.io/role/internal-elb", "1",
      "SubnetType", "Private",
      "App-Type", "DB"
    )
  )}"
}

#Create App Subnets
resource "aws_subnet" "VPC-app-subnet" {
  count = "${length(var.app_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.app_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = false

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-app-${count.index}",
      "kubernetes.io/role/internal-elb", "1",
      "SubnetType", "Private",
      "App-Type", "App"
    )
  )}"
}

#Create VPN Subnets
resource "aws_subnet" "VPC-vpn-subnet" {
  count = "${length(var.vpn_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.new_vpc.id}"
  cidr_block              = "${element(var.vpn_subnet_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  
  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-vpn-${count.index}",
      "kubernetes.io/role/elb", "1",
      "kubernetes.io/role/alb-ingress", "1",
      "SubnetType", "Utility",
      "App-Type", "VPN"
    )
  )}"
}





