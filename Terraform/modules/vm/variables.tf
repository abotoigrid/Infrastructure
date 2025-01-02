variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch in"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID"
}

variable "instance_key_name" {
  type        = string
  description = "Key name to use for the instance"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}