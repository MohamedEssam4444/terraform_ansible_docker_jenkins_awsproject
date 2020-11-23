provider "aws"{
  region = "us-west-2"
}
variable "name" {
  description ="name instance on deploy"
}
resource "aws_security_group" "this" {

 ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "this" {
  ami           = "ami-0ac73f33a1888c64a"
  instance_type = "t2.micro"
  key_name      = "jenkins1"
  tags = {
  Name = "${var.name}"
 }
}
