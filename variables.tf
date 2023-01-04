variable "account_id" {
  description = "The AWS Account ID to provision the resources"
}

variable "region" {
  description = "The AWS region we wish to provision in, by default"
}


# S3 Variables

variable "acl" {
  type        = string
  default     = "private"
  description = <<-EOT
    The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply.
    Recommendation is `private` to avoid exposing sensitive information.
    EOT
}

variable "bucket_name" {
  description = "Name of the s3 bucket"
  type        = string
  default     = "sample.caylent.dev"
}

variable "master" {
  description = "Whether to create the resources or not"
  type        = bool
  default     = true
}

variable "public_access" {
  description = "Whether Amazon S3 should block public ACLs for this bucket. Defaults to false"
  type        = bool
  default     = true
}


# Route 53 Variables

variable "domain_name" {
  description = "Name of the domain name"
  type        = string
  default     = "caylent.dev"
}

variable "health_evaluation" {
  description = "Set to true for Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set"
  type        = bool
  default     = false
}

variable "record_type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT"
  type        = string
  default     = "A"
}

variable "record_name" {
  description = "The name of the record"
  type        = string
  default     = "sample"
}


# CloudFront Variables

variable "comment" {
  description = "Any comments to include about the distribution"
  type        = string
  default     = "Sample CloudFront"
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
  default     = "PriceClass_All"
}

variable "retain_on_delete" {
  description = "Disables the distribution instead of deleting it when destroying the resource through Terraform"
  type        = bool
  default     = false
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution (maximum one)"
  type        = bool
  default     = true
}





