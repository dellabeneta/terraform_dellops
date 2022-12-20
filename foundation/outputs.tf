output "s3_bucket_teste" {
  value = aws_s3_bucket.terraform-infra-dellops.bucket_domain_name
}