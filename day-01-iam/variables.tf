variable aws_region {
  type        = string
  default     = "us-east-2"
  description = "Region of AWS"
}


variable s3_bucket_name {
  type        = string
  default     = "s3_bucket"
  description = "S3 bucket name"
}

variable s3_tags {
  type        = map(string)
  default     = {
    IAC = true
  }
  description = "description"
}

