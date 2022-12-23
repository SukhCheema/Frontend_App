output "s3_bucket_arn" {
  value = aws_s3_bucket.s3.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.s3.id
}

output "record_name" {
  value = aws_route53_record.site_domain.name
}

output "website_endpoint" {
  value = aws_s3_bucket.s3.website_endpoint
}