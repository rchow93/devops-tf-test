resource "aws_lb" "webserver" {
  name               = "${local.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.web-alb-sg-traffic.id}"]
  subnets            = ["${data.aws_subnet_ids.public.ids}"]

  enable_deletion_protection = false

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.name}-alb"
    )
  )}"
}


#######CREATE TARGET GROUPS########################
resource "aws_alb_target_group" "webserver-http" {
  name     = "alb-target-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${data.aws_vpc.prod.id}"
}

####################################################


###CREATE LISTENER#################################
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.webserver.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.webserver-http.arn}"
  }
}
#######################################################