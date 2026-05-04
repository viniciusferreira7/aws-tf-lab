# Day 01 — IAM
# Spec: criar user, group, policy customizada com least privilege para acesso S3
# Implemente aqui.
# Docs: https://claude.ai/chat/b56e5225-534f-45f9-b609-876f629b663c

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.s3_bucket_name}-${var.aws.region}-${random_id.suffix.hex}"

  tags = var.s3_tags
}

resource "resource random_id name {
  byte_length = 4
}
"

