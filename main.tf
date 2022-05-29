# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  access_key = ""
  secret_key = ""
}

resource "aws_vpc" "main-vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    "Name" = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = "10.1.0.0/24"

  tags = {
    "Name" = "prod-subnet"
  }
}

resource "aws_instance" "terraform_ex" {
  ami           = "ami-015c25ad8763b2f11" # us-west-2
  instance_type = "t2.micro"
  tags = {
        Name = "terraform_ex"
    }
}