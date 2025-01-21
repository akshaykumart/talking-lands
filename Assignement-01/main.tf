provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web_sg" {
  name        = "nginx-sg-${var.environment}"
  description = "Allow HTTP and SSH traffic"
  vpc_id      =  var.aws_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg-${var.environment}"
  }
}

resource "aws_instance" "nginx_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.id]
  subnet_id     = var.aws_subnet_id
  
  tags = {
    Name = "nginx-instance-${var.environment}"
  }

  provisioner "file" {
    source      = "bootstrap.sh"  
    destination = "/tmp/bootstrap.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"           
      private_key = file("talking-lands-2.pem") 
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo /tmp/bootstrap.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"           
      private_key = file("talking-lands-2.pem")
      host        = self.public_ip
    }
  }
}
