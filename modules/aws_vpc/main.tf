resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags = "${merge(map("Name", "${var.prefix}"), "${var.operation_tags}")}"
}

resource "aws_vpc_dhcp_options" "dopts" {
  domain_name         = "${var.region}.compute.internal"
  domain_name_servers = ["${var.dns_servers}"]
  ntp_servers         = []
  tags = "${merge(map("Name", "${var.prefix}"), "${var.operation_tags}")}"
}

resource "aws_vpc_dhcp_options_association" "main" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dopts.id}"
}
