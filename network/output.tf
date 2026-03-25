output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID de la subnet"
  value       = aws_subnet.this.id
}