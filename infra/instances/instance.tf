

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name

  # the VPC subnet
  subnet_id = var.PUBLIC_SUBNET_1_ID

  # user data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered

  tags = {
    Name = "web-proxy-2"
  }

  # user_data = <<-EOF
  #             #!/bin/bash
  #             apt-get install mysql-client
  #             echo "Hello, World" > index.html
  #             nohup busybox httpd -f -p 8080 &
  #             EOF
}

output "web-address" {
  value = aws_instance.web.public_dns
}
