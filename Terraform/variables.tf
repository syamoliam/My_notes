variable "aws_region" {
  description = "AWS region"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
}

variable "instance_ami" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
}

variable "bucket_name" {
  description = "Name for S3 bucket"
}

variable "bucket_acl" {
  description = "Access control list for S3 bucket"
}
