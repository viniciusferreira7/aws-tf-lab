# Day 01 — IAM
# Spec: criar user, group, policy customizada com least privilege para acesso S3
# Implemente aqui.
# Docs: https://claude.ai/chat/b56e5225-534f-45f9-b609-876f629b663c

resource "aws_s3_bucket" "study_bucket" {
  bucket = "${var.s3_bucket_name}-${var.aws.region}-${random_id.suffix.hex}"

  tags = var.s3_tags
}

resource "resource random_id name {
  byte_length = 4
}

resource "aws_s3_bucket_public_access_block" "study_bucket" {
  bucket = aws_s3_bucket.study_bucket.id

  block_public_acls= true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "s3_read_only" {
  statement {
    sid = "AllowListBucket"
    effect = "Allow"
    actions = ["s3:ListBucket"]
    resources = [aws_s3_bucket.study_bucket.arn]
  }

  statement {
    sid    = "AllowGetObject"
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.study_bucket.arn}/*"]
  }
}

resource "aws_iam_policy" "s3_read_only" {
  name = "${var.project_name}-s3-read-only"
  description = "Allow list and download study bucket. Least privilege"
  policy = aws_iam_policy_document.s3_read_only.json
}

resource "aws_iam_group" "s3_readers" {
  name = "s3_readers"
}

resource "aws_iam_policy_attachment" "s3_read_only" {
  group = aws_iam_group.s3_readers.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}