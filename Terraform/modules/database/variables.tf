variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
}

variable "db_username" {
  type        = string
  description = "Username for the database"
}

variable "db_password" {
  type        = string
  description = "Password for the database"
  sensitive   = true
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

