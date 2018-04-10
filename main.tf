## ALB
resource "aws_lb" "main" {
  name                       = "${var.alb_name}"
  internal                   = "${var.alb_internal}"
  load_balancer_type         = "${var.alb_load_balancer_type}"
  security_groups            = ["${var.alb_security_groups}"]
  subnets                    = ["${var.alb_subnets}"]
  enable_deletion_protection = "${var.alb_enable_deletion_protection}"
  #access_logs {
  #  bucket = "${aws_s3_bucket.lb_logs.bucket}"
  #  prefix = "test-lb"
  #}

  tags {
    Name        = "${var.alb_tag_name}"
    Environment = "${var.alb_environment}"
  }
}

#####  ALB LISTENER

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.main.arn}"
  port              = "${var.aws_lb_listener_port}"
  protocol          = "${var.aws_lb_listener_protocol}"
 # ssl_policy        = "${var.aws_lb_listener_ssl_policy}"
 # certificate_arn   = "${var.aws_lb_listener_certificate_arn}"
  default_action {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    type             = "forward"
  }
}

#####  ALB TARGET GROUP

resource "aws_lb_target_group" "main" {
  name     = "${var.aws_lb_target_group_name}"
  port     = "${var.aws_lb_target_group_port}"
  protocol = "${var.aws_lb_target_group_protocol}"
  vpc_id   = "${var.aws_lb_target_group_vpc_id}"
}


#####  ALB TARGET GROUP ATTACHMENT 1

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = "${aws_lb_target_group.main.arn}"
  target_id        = "${var.aws_lb_target_group_attachment_instance_id1}"
  port             = "${var.aws_lb_target_group_attachment_port1}"
}

#####  ALB TARGET GROUP ATTACHMENT 2

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = "${aws_lb_target_group.main.arn}"
  target_id        = "${var.aws_lb_target_group_attachment_instance_id2}"
  port             = "${var.aws_lb_target_group_attachment_port2}"
}
