
data "template_file" "web-userdata" {
  template = "${file("user_data.tpl")}"
}

resource "aws_launch_configuration" "web-server-lc" {
  name_prefix          = "${var.region}-${var.env}-${var.app}-lc"
  image_id             = "${data.aws_ami.ubuntu.id}"
  instance_type        = "${var.web-instance-type}"
  security_groups      = ["${aws_security_group.web-sg-traffic.id}"]

  iam_instance_profile = "${aws_iam_instance_profile.web_profile.name}"


  lifecycle {
    create_before_destroy = true
  }

  key_name = "${aws_key_pair.web-server.id}"
  user_data = "${data.template_file.web-userdata.rendered}"

}


resource "aws_autoscaling_group" "web-server-asg" {
  vpc_zone_identifier = ["${element(data.aws_subnet_ids.public.ids, count.index)}"]
  name                = "${var.region}-${var.env}-${var.app}-asg"
  max_size            = "${var.max-instances}"
  min_size            = "${var.min-instances}"

  desired_capacity = "${var.desired-instances}"

  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.web-server-lc.name}"
  target_group_arns = ["${aws_alb_target_group.webserver-http.arn}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.region}-${var.env}-${var.app}-web"
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
