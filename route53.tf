resource "aws_route53_record" "record" {
  zone_id = "Z0999433ZG0Q0Z7K66A7"
  name    = "dellops.online"
  type    = "A"
  ttl = 300
  records = [aws_instance.instance.public_ip]
}