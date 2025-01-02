variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "subnet_cidr_block_a" {
  type        = string
  description = "CIDR block for Subnet A"
}
variable "subnet_cidr_block_b" {
  type        = string
  description = "CIDR block for Subnet B"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}