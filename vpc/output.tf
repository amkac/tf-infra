

output "public-subnet-id" {
  value = aws_subnet.main-public-1.id
}

output "main-vpc-id" {
  value = aws_vpc.main.id
}

