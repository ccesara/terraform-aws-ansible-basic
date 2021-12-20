## By Arcanjo Caio [ccesara87@gmail.com]
## Created -> Dec 2021


resource "aws_security_group" "hosts" {
  name        = "hosts"
  vpc_id = "${aws_vpc.prod-vpc.id}"
  description = "Custom Secuiry Group - hosts"
  ingress {
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
    description      = "Allow All"
    from_port        = 0
    ipv6_cidr_blocks = [
      "::/0",
    ]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  egress {
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = [
      "::/0",
    ]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  tags = {
    Name = "hosts"
  }
}

resource "aws_security_group" "alb" {
  name        = "alb"
  vpc_id = "${aws_vpc.prod-vpc.id}"
  description = "Custom Secuiry Group - alb"
  ingress {
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
    description      = "Allow All"
    from_port        = 0
    ipv6_cidr_blocks = [
      "::/0",
    ]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  egress {
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = [
      "::/0",
    ]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  tags = {
    Name = ""
  }
}
