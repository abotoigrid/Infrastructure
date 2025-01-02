variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "eu-central-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0a628e1e89aaedf80" 
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t3.micro"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block_a" {
  type        = string
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_block_b" {
  type        = string
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
  default     = "mydb"
}

variable "db_username" {
  type        = string
  description = "Username for the database"
  default     = "dbuser"
}

variable "db_password" {
  type        = string
  description = "Password for the database"
  sensitive   = true          
  default     = "password123" 
}

variable "instance_key_name" {
  type        = string
  description = "Name of the key pair to associate with the EC2 Instance"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

