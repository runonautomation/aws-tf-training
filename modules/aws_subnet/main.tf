resource "aws_subnet" "main" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.cidr_block}"
  availability_zone = "${var.availability_zone}"
  tags = "${var.tags}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
}

resource "aws_route_table_association" "public" {
  count = "${var.map_public_ip_on_launch == "true" ? 1 : 0}"
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${var.public_route_table_id}"
}