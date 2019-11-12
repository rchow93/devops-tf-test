#Under production loads - a NAT GW should always be used (usually one per AZ)


#reserve EIP for NAT GW
resource "aws_eip" "vpc-nat" {
  vpc = true
}


#Setup NatGW
resource "aws_nat_gateway" "vpc-natgw" {
  allocation_id = "${aws_eip.vpc-nat.id}"
  subnet_id = "${aws_subnet.VPC-private-subnet.1.id}"

  # Dependency on IGW
  depends_on = ["aws_internet_gateway.vpc-igw"]

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-natgw"
    )
  )}"
}





