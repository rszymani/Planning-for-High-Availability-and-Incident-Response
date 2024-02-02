resource "aws_instance" "ubuntu" {
  ami           = var.ami_aws
  count = var.count
  instance_type = var.instance_type
  subnet_id = var.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Web"
  }
}

resource "aws_security_group" "ec2_sg" {
 id = "ec2_sg_id"
 name = "ec2_sg"
 ingress {
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
 }
 ingress {
   from_port = "22"
   to_port = "22"
   protocol = "tcp"
 }
 tags = {
  Name = "ec2_sg"
 }
}