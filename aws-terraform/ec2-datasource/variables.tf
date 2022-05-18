# AWS Region
variable "aws_region" {
  description = "The region in which resources are deployed"
  type        = string
  default     = "us-east-1"
}

# AWS Instance Type
variable "ec2_instance_type" {
  type        = string
  description = "Type of ec2 Instance type"
  default     = "t2.micro"
}

# EC2 key pair
variable "ec2_key_pair" {
  type        = string
  description = "EC2 key pair that needs to be assocaited with EC2 Instance"
  default     = "tf-ec2-access-key"
}

