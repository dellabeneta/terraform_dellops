resource "aws_instance" "instance" {
  ami = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg_instance.id]
  key_name = "dellops"
  

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = file("~/.ssh/id_rsa.pub")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "wget https://terraform-infra-dellops.s3.amazonaws.com/script.sh",
      "sudo chmod +x script.sh",
      "sudo ./script.sh"
    ]
  }

  tags = {
    "Name" = "dellops_instance"
  }  
}