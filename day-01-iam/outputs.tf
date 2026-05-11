# Outputs do Day 01
# Ex: user ARN, group name, policy ARN
output "bucket_name" {
  value = aws_s3_bucket.study_body.id
  description = "Bucket name created - it necessary to tests using CLI"
}

output "policy_arn" {
  value = aws_iam_policy.s3_read_only.arn
  description = "Custom ARN"
}

output "user_access_key_id" {
  value = aws_iam_access_key.vinicius_s3
  sensitive = true
  description = "Secret Access Key"
}