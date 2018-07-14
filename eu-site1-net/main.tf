terraform {
  backend "s3" {
    bucket = "training-vdavyden-eu-site-1-net"
    key    = "eu-site-1-net"
    region = "eu-west-2"
  }
}

module "vpc" {
  source = "../modules/aws_vpc"
  region = "${var.region}"
  cidr = "${var.vpc_cidr}"
  prefix = "${var.prefix}"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  dns_servers = ["AmazonProvidedDNS"]
  operation_tags = "${merge(
	  "${var.operation_tags}"
	)}"
}

module "aws_internet_gateway" {
  source = "../modules/aws_igw"
  vpc_id = "${module.vpc.vpc_id}"
  prefix = "${var.prefix}"
  operation_tags  = "${merge(
	  "${var.operation_tags}"
	)}"
}

module "aws_subnet_public" {
  source      = "../modules/aws_subnet"
  vpc_id = "${module.vpc.vpc_id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.public_subnet_az}"
  tags = "${merge(map("Name", "${var.prefix}-public"), "${var.operation_tags}")}"
  map_public_ip_on_launch = "true"
  public_route_table_id = "${module.aws_internet_gateway.route_table_id}"
}

resource "aws_security_group" "web_sg" {
  vpc_id       = "${module.vpc.vpc_id}"
  name         = "web_sg"
  description  = "Allow WEB access"
ingress {
    cidr_blocks = ["0.0.0.0/0"]  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
ingress {
    cidr_blocks = ["0.0.0.0/0"]  
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  egress {
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port  = 0
    to_port    = 65535
  }

tags = {
        Name = "web_sg"
  }
}