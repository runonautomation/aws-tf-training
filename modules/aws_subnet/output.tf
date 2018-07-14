output "id" {
  value       = "${aws_subnet.main.id}"
}

output "cidr_block" {
  value       = "${aws_subnet.main.cidr_block}"
}

output "az" {
  value       = "${aws_subnet.main.availability_zone}"
}

output "vpc_id" {
  value       = "${var.vpc_id}"
}
