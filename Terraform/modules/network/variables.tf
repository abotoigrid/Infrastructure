variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR block for Subnet"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}