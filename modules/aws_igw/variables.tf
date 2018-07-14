variable "prefix" {
  type        = "string"
}

variable "vpc_id" {
  type        = "string"
}

variable "operation_tags" {
  type        = "map"
  default     = {}
}