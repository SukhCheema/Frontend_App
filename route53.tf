#------------------------------------------------------------------------------------
# Route 53
#------------------------------------------------------------------------------------

# Get hosted zone details

data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}


# Create a record set in Route 53

resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = var.record_type

  alias {
    name                   = aws_s3_bucket.s3.website_endpoint
    zone_id                = aws_s3_bucket.s3.hosted_zone_id
    evaluate_target_health = var.health_evaluation
  }
}