resource "aws_internet_gateway" "public" {
  vpc_id = "${var.vpc_id}"
  tags = "${merge(map("Name", "${var.prefix}"), "${var.operation_tags}")}"
}

resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(map("Name", "${var.prefix}-public"), "${var.operation_tags}")}"
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
  depends_on             = ["aws_route_table.public"]
}
