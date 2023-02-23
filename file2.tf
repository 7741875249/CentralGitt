provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARSBIXO2FLLFLNS4Y"
  secret_key = "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"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

