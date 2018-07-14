variable "region" {
  type = "string"
  default = "eu-west-2"
}

variable "prefix" {
  default = "eu-site1"
}

variable "vpc_cidr" {
  type = "string"
  default = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  type = "string"
  default = "10.1.1.0/24"
}

variable "public_subnet_az" {
  type = "string"
  default = "eu-west-2a"
}

variable "operation_tags" {
  type = "map"
  default = { 
    CostCenter = "Training" 
  }

}