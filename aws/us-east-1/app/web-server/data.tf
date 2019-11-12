#this is a placeholder for file that can be used for lookups of existing aws resources to be used as part of your code.

#find the latest ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#lookup VPC ID
data "aws_vpc" "prod" {
  state="available"
  tags {
    Name="${var.region}-${var.env}-vpc-tf-test"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.prod.id}"

  tags = {
    App-Type = "Public"
  }
}

data "aws_security_group" "bastion" {
  tags {
    Name="${var.region}-${var.env}-vpc-tf-test-bastion"
  }
}

