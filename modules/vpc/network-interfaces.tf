/*
#Placeholder to create the ENI and EIP that will be used by the NAT/Bastion Instance.
#This is the ENI that will be used by the NAT/Bastion Host
resource "aws_network_interface" "bastion-nat_eni" {
  subnet_id       = "${aws_subnet.VPC-dmz-subnet.0.id}"
  security_groups = ["${aws_security_group.bastion-sg-traffic.id}"]
  source_dest_check = false

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-bastion-eni"
    )
  )}"

  depends_on = ["aws_subnet.VPC-private-subnet"]

}


#This is the EIP for the NAT/Bastion Host
resource "aws_eip" "bastion-nat-eip" {
  vpc              = true

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-bastion-eip"
    )
  )}"

}
*/