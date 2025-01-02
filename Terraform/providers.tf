terraform {

   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    }
  backend "s3" {
    bucket = "abt-my-bucket-capstone-project"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}