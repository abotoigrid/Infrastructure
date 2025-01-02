provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "abt-my-bucket-capstone-project"
  tags = {
    Name    = "Capstone Project Bucket"
    Owner   = "abotoi"
    Project = "2024_internship_moldova"
  }
  lifecycle {
    prevent_destroy = true
  }
}