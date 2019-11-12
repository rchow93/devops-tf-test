#Create a new IGW
resource "aws_internet_gateway" "vpc-igw" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-igw"
    )
  )}"
}
