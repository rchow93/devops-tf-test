#create default web alb sg


resource "aws_security_group" "web-alb-sg-traffic" {
  name        = "${local.name}-alb-sg-web"
  description = "Allow web traffic from alb"
  vpc_id      = "${data.aws_vpc.prod.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-alb-webserver"
    )
  )}"

}




resource "aws_security_group" "web-sg-traffic" {
  name        = "web-traffic-to-ec2"
  description = "Allow web traffic from alb"
  vpc_id      = "${data.aws_vpc.prod.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups=["${aws_security_group.web-alb-sg-traffic.id}"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups=["${data.aws_security_group.bastion.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-webserver"
    )
  )}"

}
