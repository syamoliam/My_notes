# Define provider
provider "aws" {
  region = var.aws_region
}

# Define VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Define subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
}

# Define EC2 instance
resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet1.id
}

# Define S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
}

# Define ELB
resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet1.id]
}

# Define target group
resource "aws_lb_target_group" "example" {
  name     = "example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

# Define secret
resource "aws_secretsmanager_secret" "example" {
  name = "example-secret"
}

# Define output
output "instance_ip" {
  value = aws_instance.example.public_ip
}
