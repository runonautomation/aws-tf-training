variable "prefix" {
  description = "Name to prefix the VPC/DHCP resources with"
  type        = "string"
}

variable "region" {
  description = "Region were VPC will be created"
  type        = "string"
}

variable "cidr" {
  description = "CIDR range of VPC. eg: 172.16.0.0/16"
  type        = "string"
}

variable "operation_tags" {
  description = "Extra tags that will be added to VPC and DHCP resources"
  default     = {}
  type        = "map"
}

variable "enable_dns_hostnames" {
  default     = true
  type        = "string"
}

variable "enable_dns_support" {
  default     = true
  type        = "string"
}

variable "dns_servers" {
  default     = ["AmazonProvidedDNS"]
  type        = "list"
}

