variable "vpc_id" {
  type        = "string"
}

variable "cidr_block" {
  type        = "string"
}

variable "availability_zone" {
  type        = "string"
}

variable "tags" {
  type        = "map"
}

variable "operation_tags" {
  default     = {}
  description = "Resource tags"
  type        = "map"
}

variable "map_public_ip_on_launch" {
  default     = "true"
  type        = "string"
}

variable "public_route_table_id" {
  default     = ""
  type        = "string"
}
