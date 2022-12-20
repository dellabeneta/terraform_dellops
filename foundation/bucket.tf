resource "aws_s3_bucket" "terraform-infra-dellops" {
  bucket = "terraform-infra-dellops"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "terraform-infra-dellops_acl" {
  bucket = aws_s3_bucket.terraform-infra-dellops.id
  acl    = "private"
}

resource "aws_s3_object" "objects" {
  for_each = fileset("scripts/", "*")
  bucket = aws_s3_bucket.terraform-infra-dellops.id
  key = each.value
  acl    = "public-read"
  source = "scripts/${each.value}"
  etag = filemd5("scripts/${each.value}")
}