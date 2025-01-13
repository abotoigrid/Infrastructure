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

variable "ec2_key_name" {
  type        = string
  description = "Key name to use for the instance"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group"
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to the EC2 instance"
  type        = string
}