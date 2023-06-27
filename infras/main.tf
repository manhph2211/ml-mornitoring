variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

locals {
  vpc_id           = "vpc-007085122727509c4"
  subnet_id        = "subnet-0389f1afa313a370f"
  ssh_user         = "ubuntu"
  ami              = "ami-0df7a207adb9748c7"
  region           = "ap-southeast-1"
  access_key       = var.AWS_ACCESS_KEY_ID
  secret_key       = var.AWS_SECRET_ACCESS_KEY
}

provider "aws" {
  region = local.region
  access_key = local.access_key
  secret_key = local.secret_key
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "private_key" {
  filename        = "${path.module}/ansible.pem"
  content         = tls_private_key.key.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "ansible"
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_security_group" "nginx" {
  name   = "nginxx"
  vpc_id = local.vpc_id
  lifecycle {
    create_before_destroy = true
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
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

resource "aws_instance" "nginx" {
  ami                         = local.ami
  subnet_id                   = local.subnet_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx.id]
  key_name                    = aws_key_pair.key_pair.key_name

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = tls_private_key.key.private_key_pem 
      host        = aws_instance.nginx.public_ip
    }
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.nginx.public_ip}, --key-file ansible.pem nginx.yaml"
  }
}

output "nginx_ip" {
  value = aws_instance.nginx.public_ip
}