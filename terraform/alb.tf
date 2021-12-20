## By Arcanjo Caio [ccesara87@gmail.com]
## Created -> Dec 2021


resource "aws_alb" "alb" {
  name            = "alb"
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.prod-subnet-public-1.id}","${aws_subnet.prod-subnet-public-2.id}"]
}

resource "aws_alb_target_group" "app01" {
  name     = "app01"
  vpc_id = "${aws_vpc.prod-vpc.id}"
  port     = 80
  protocol = "HTTP"
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/index.html"
    port = 80
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.app01.arn}"
    type             = "forward"
  }
}

output "lb_address" {
  value = aws_alb.alb.dns_name
}
