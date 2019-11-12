
# VPC endpoint for S3
resource "aws_vpc_endpoint" "default" {
  vpc_id          = "${aws_vpc.new_vpc.id}"
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${concat(aws_route_table.VPC-dmz-rtb.*.id, aws_route_table.VPC-app-rtb.*.id, aws_route_table.VPC-db-rtb.*.id, aws_route_table.VPC-public-rtb.*.id, aws_route_table.VPC-vpn-rtb.*.id, aws_route_table.VPC-private-rtb.*.id)}"]
}
