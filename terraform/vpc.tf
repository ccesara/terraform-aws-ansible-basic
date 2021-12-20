## By Arcanjo Caio [ccesara87@gmail.com]
## Created -> Dec 2021

resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.66.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"
    tags = {
        Name = "prod-vpc"
    } 
}

resource "aws_route_table" "route-prod" {
  vpc_id = "${aws_vpc.prod-vpc.id}"
  tags = {
    Name        = "vpc-prod"
  }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.66.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.availability_zone.a}"
    tags = {
        Name = "prod-vpc-subnet-1"
    } 
}

resource "aws_subnet" "prod-subnet-public-2" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.66.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.availability_zone.b}"
    tags = {
        Name = "prod-vpc-subnet-2"
    }
}

resource "aws_internet_gateway" "prod-igw" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    tags = {
        Name = "prod-vpc-gw"
    }
}

resource "aws_route" "internet_gateway" {
  route_table_id         = "${aws_route_table.route-prod.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.prod-igw.id}"
}

resource "aws_route_table_association" "prod-subnet-public-1" {
  subnet_id      = "${aws_subnet.prod-subnet-public-1.id}"
  route_table_id = "${aws_route_table.route-prod.id}"
}

resource "aws_route_table_association" "prod-subnet-public-2" {
  subnet_id      = "${aws_subnet.prod-subnet-public-2.id}"
  route_table_id = "${aws_route_table.route-prod.id}"
}