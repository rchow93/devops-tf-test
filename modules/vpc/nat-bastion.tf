########################################################################
#Get the AMI id for the latest ubuntu AMI                             #
########################################################################

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



##############################################################################################
#This will the user data template to execute on startup to configure the NAT/Bastion Instance
###############################################################################################
data "template_file" "userdata3" {
  template = "${file("${path.module}/templates/user_data.tpl")}"
}

resource "aws_launch_configuration" "bastion-nat-lc" {
  name_prefix          = "${var.region}-${var.env}-${var.app}-lc"
  image_id             = "${data.aws_ami.ubuntu.id}"
  instance_type        = "${var.bastion-instance-type}"
  security_groups      = ["${aws_security_group.bastion-sg-traffic.id}"]
#  iam_instance_profile = "us-west-2-prod-iam-policy-bastion-instance-profile"

  iam_instance_profile = "${aws_iam_instance_profile.bastion_profile.name}"


  lifecycle {
    create_before_destroy = true
  }

  key_name = "${var.prod-packer-ssh}"

  user_data = "${data.template_file.userdata3.rendered}"
}


resource "aws_autoscaling_group" "bastion-nat-asg" {
  vpc_zone_identifier = ["${aws_subnet.VPC-dmz-subnet.0.id}"]
  name                = "${var.region}-${var.env}-${var.app}-asg"
  max_size            = 1
  min_size            = 1

  desired_capacity = 1

  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.bastion-nat-lc.name}"

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.region}-${var.env}-${var.app}-bastion"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Region"
    value               = "${var.region}"
    propagate_at_launch = true
  }

  tag {
    key                 = "App"
    value               = "${var.app}"
    propagate_at_launch = true
  }

}

