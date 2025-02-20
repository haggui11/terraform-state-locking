provider "aws" {
   region     = "eu-central-1"
   access_key = var.access_key
   secret_key = var.secret_key
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0767046d1677be5a0"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state - developer 2"
    }
}

terraform {
  backend "s3" {
    bucket         = "jhooq-terraform-s3-bucket2"
    key            = "jhooq/terraform/remote/s3/terraform.tfstate"
    encrypt        = true
    region         = "eu-central-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}