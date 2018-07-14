output "vpc_id" {
  value       = "${aws_vpc.vpc.id}"
  description = "VPC ID"
}

output "vpc_cidr_block" {
  value       = "${aws_vpc.vpc.cidr_block}"
  description = "VPC CIDR block"
}

output "dhcp_options_id" {
  value       = "${aws_vpc_dhcp_options.dopts.id}"
  description = "ID of the DHCP options resource"
}
