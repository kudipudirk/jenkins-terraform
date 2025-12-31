resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.mysg.id]

    tags = {
        Name = "Docker"
    }

    /* connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
    }

    provisioner "file" {
      source      = "docker.sh"
      destination = "/tmp/docker.sh"
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/docker.sh",
        "/tmp/docker.sh args",
      ]
    } */
}

resource "aws_security_group" "mysg" {
  name = "mysecurity-group"

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "2232"
    to_port = "2232"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "81"
    to_port = "81"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "8080"
    to_port = "8080"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}