#Create 6 Default Security Groups for the subnets


#create default dmz sg
resource "aws_security_group" "dmz-sg-traffic" {
  name        = "${local.name}-dmz"
  description = "Allow dmz VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["${var.my_ips}"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
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
      "Name", "${local.name}-dmz"
    )
  )}"

}

#create default private sg
resource "aws_security_group" "private-sg-traffic" {
  name        = "${local.name}-private"
  description = "Allow private VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
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
      "Name", "${local.name}-private"
    )
  )}"

}

#create default public sg
resource "aws_security_group" "public-sg-traffic" {
  name        = "${local.name}-public"
  description = "Allow public VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
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
      "Name", "${local.name}-public"
    )
  )}"

}

#create default db sg
resource "aws_security_group" "db-sg-traffic" {
  name        = "${local.name}-db"
  description = "Allow db VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
  }

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    cidr_blocks = ["${var.app_subnet_cidr_blocks}"]  
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
      "Name", "${local.name}-db"
    )
  )}"

}

#create default app sg
resource "aws_security_group" "app-sg-traffic" {
  name        = "${local.name}-app"
  description = "Allow app VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
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
      "Name", "${local.name}-app"
    )
  )}"

}

#create default vpn sg
resource "aws_security_group" "vpn-sg-traffic" {
  name        = "${local.name}-vpn"
  description = "Allow vpn VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["${var.my_ips}"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups  = ["${aws_security_group.bastion-sg-traffic.id}"]
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
      "Name", "${local.name}-vpn"
    )
  )}"

}




#create default bastion sg
resource "aws_security_group" "bastion-sg-traffic" {
  name        = "${local.name}-bastion"
  description = "Allow dmz VPC traffic "
  vpc_id      = "${aws_vpc.new_vpc.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["${concat(var.private_subnet_cidr_blocks, var.app_subnet_cidr_blocks, var.db_subnet_cidr_blocks)}"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    
    cidr_blocks = ["${var.my_ips}"]
  }


  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    
    cidr_blocks = ["${concat(var.private_subnet_cidr_blocks, var.app_subnet_cidr_blocks, var.db_subnet_cidr_blocks)}"]
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
      "Name", "${local.name}-bastion"
    )
  )}"

}

