

output "instance-public-ip" {
  value = aws_instance.web.public_ip
}
