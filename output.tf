output "instance_public_ip" {
  description = "IP pública de la instancia"
  value       = module.infra.instance_public_ip
}

output "instance_id" {
  description = "ID de la instancia"
  value       = module.infra.instance_id
}

output "instance_name" {
  description = "Tag Name de la instancia"
  value       = module.infra.instance_name
}

output "availability_zone" {
  description = "Zona de disponibilidad de la instancia"
  value       = module.infra.availability_zone
}

output "vpc_id" {
  description = "ID de la VPC"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "ID de la subnet"
  value       = module.network.subnet_id
}

output "owner" {
  description = "Tag owner"
  value       = var.tags.owner
}