provider "aws" {
  region = "us-west-2"
}


resource "aws_s3_bucket" "b1" {
  bucket = "aws-s3-devops-task-elyas"
  acl    = "private"

  
  versioning {
    enabled = true
  }
  
  lifecycle_rule {
    enabled = true

    transition {
      storage_class = "INTELLIGENT_TIERING"
    }
  }


  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}



