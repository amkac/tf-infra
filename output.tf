
# output "web-instance-public-ip" {
#   description = "web instance public ip"
#   value       = module.instances.web-instance-public-ip
# }


# network
output "vpc-id" {
  description = "VPC id"
  value       = module.main-vpc.main-vpc-id
}

output "ELB-dns" {
  value = module.instances.ELB-dns
}

output "ecr-repository-url" {
  value = module.ecr.repository-url
}


# output "rds-instance-endpoint" {
#   value = module.rds.rds-instance-endpoint
# }
