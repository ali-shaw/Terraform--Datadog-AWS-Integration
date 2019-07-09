provider "aws" {
  profile = "default"
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"
}
