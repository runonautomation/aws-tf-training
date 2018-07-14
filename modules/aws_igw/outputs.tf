output "route_table_id" {
  value       = "${aws_route_table.public.id}"
}

output "gateway_id" {
  value       = "${aws_internet_gateway.public.id}"
}