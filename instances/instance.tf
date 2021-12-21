
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

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name

  # the VPC subnet
  subnet_id = var.PUBLIC_SUBNET_ID

  user_data = <<-EOF
              #!/bin/bash
              apt-get install mysql-client
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

output "web-address" {
  value = "${aws_instance.web.public_dns}:8080"
}
