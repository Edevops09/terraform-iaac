terraform {
  backend "s3" {
    bucket         = "test-terraform-s3-bucket-2022-2042"
    key            = "path/to/my/key/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "test-terraform-s3-bucket-2022-2042"
  versioning {
    enabled = true
  }

  tags = {
    Name        = "My tf bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_instance" "ec2_example" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Instance with remote state"
  }
}

