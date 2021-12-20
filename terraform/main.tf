## By Arcanjo Caio [ccesara87@gmail.com]
## Created -> Dec 2021


provider "aws" {
  region = "${var.region.virginia}"
}

resource "aws_key_pair" "access_key" {
  key_name   = "access_key"
  public_key = "${var.pair_key.key_a}"
}

resource "aws_instance" "host_a" {
  ami = "${var.amis["ubuntu20"]}"
  instance_type = "${var.instance_type.micro}"
  subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
  key_name = "access_key"
  tags = {
    Name = "host_a"
    Application = "nginx"
  }
  vpc_security_group_ids = ["${aws_security_group.hosts.id}"]
}
resource "aws_alb_target_group_attachment" "host_a" {
  target_group_arn = aws_alb_target_group.app01.arn
  target_id        = aws_instance.host_a.id
  port             = 80
}


resource "aws_instance" "host_b" {
  ami = "${var.amis["ubuntu20"]}"
  instance_type = "${var.instance_type.micro}"
  subnet_id = "${aws_subnet.prod-subnet-public-2.id}"
  key_name = "access_key"
  tags = {
    Name = "host_b"
    Application = "apache"
  }
  vpc_security_group_ids = ["${aws_security_group.hosts.id}"]
}
resource "aws_alb_target_group_attachment" "host_b" {
  target_group_arn = aws_alb_target_group.app01.arn
  target_id        = aws_instance.host_b.id
  port             = 80
}
