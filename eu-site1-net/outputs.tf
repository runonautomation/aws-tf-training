output "vpc_id" {
  value       = "${module.vpc.vpc_id}"
}

output "vpc_cidr" {
  value       = "${var.vpc_cidr}"
}

output "public_subnet_id" {
  value       = "${module.aws_subnet_public.id}"
}

output "public_subnet_cidr" {
  value       = "${var.public_subnet_cidr}"
}

output "web_sg_id" {
  value       = "${aws_security_group.web_sg.id}"
}