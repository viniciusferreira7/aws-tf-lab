variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "account_id" {
  type        = string
  description = "AWS account ID — usado no nome do bucket para garantir unicidade global"
}
