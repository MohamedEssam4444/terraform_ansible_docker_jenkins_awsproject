provider "aws"{
  region = "us-west-2"
}
variable "name" {
  description ="name instance on deploy"
}

resource "aws_security_group" "this" {
  name        = "allow_jenkins"
  description = "Allow jenkins inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.2.33/32"]
  }

  ingress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 0
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_instance" "this_web" {
  ami           = "ami-0ac73f33a1888c64a"
  instance_type = "t2.micro"
  key_name      = "jenkins1"
  tags = {
  Name = "${var.name}"
 }
}

