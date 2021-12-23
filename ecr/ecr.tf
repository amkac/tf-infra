resource "aws_ecr_repository" "myapp" {
  name = "myapp"
}

output "repository-url" {
  value = aws_ecr_repository.myapp.repository_url
}
