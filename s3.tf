# ---------------------------------------------------------------------------------------------
# S3
# ---------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.s3.id

  acl = var.acl
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = var.public_access
  block_public_policy     = var.public_access
  ignore_public_acls      = var.public_access
  restrict_public_buckets = var.public_access
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.master ? 1 : 0
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.this.json
}


#------------------------------------------------------------------------------------
# Datasource for Bucket Policy
#------------------------------------------------------------------------------------

data "aws_iam_policy_document" "this" {

  statement {
    sid     = "PublicReadGetObject"
    effect  = "Allow"
    actions = ["s3:GetObject"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]

  }
}