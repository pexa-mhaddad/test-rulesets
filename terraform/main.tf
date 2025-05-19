terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# Minimal resource for testing
resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-unique-name"
}