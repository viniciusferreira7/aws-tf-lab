variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Region of AWS"
}


variable "project_name" {
  type        = string
  default     = "s3_bucket"
  description = "S3 bucket name using as prefix"
}

variable "s3_tags" {
  type = map(string)
  default = {
    IAC = true
    Env = "dev"
  }
  description = "description"
}

