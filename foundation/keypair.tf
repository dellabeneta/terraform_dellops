resource "aws_key_pair" "key_pair" {
  key_name   = "dellops"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    "Name" = "dellops_key_pair"
  }
}