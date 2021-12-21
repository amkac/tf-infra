

output "web-instance-public-ip" {
  value = aws_instance.web.public_ip
}

output "web-instance-sg-ids" {
  value = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
}
