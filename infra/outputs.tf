output "instance_public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "IP privada de la instancia"
  value       = aws_instance.this.private_ip
}

output "instance_id" {
  description = "ID de la instancia"
  value       = aws_instance.this.id
}

output "instance_name" {
  description = "Tag Name de la instancia"
  value       = aws_instance.this.tags["Name"]
}

output "availability_zone" {
  description = "Zona de disponibilidad"
  value       = aws_instance.this.availability_zone
}