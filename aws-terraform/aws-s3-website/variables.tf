# Input variable definitions

variable "bucket_name" {
  type        = string
  description = "aws s3 bucket name"
}

variable "s3_tags" {
  type        = map(string)
  description = "tags for s3 bucket"
  default     = {}
}

variable "aws_region" {
  type        = string
  description = "region where resources are deployed"
}