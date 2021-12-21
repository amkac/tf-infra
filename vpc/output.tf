

output "public-subnet-id" {
  value = aws_subnet.main-public-1.id
}

output "private-subnet-1-id" {
  value = aws_subnet.main-private-1.id
}

output "private-subnet-2-id" {
  value = aws_subnet.main-private-2.id
}

output "private-subnet-az" {
  value = aws_subnet.main-private-1.availability_zone
}

output "main-vpc-id" {
  value = aws_vpc.main.id
}

