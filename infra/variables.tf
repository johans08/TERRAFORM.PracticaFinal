variable "ami" {
  description = "AMI de la instancia"
  type        = string
}

variable "instancia" {
  description = "Tipo de instancia"
  type        = string
}

variable "subnet_id" {
  description = "Subnet donde se desplegará la instancia"
  type        = string
}

variable "tags" {
  description = "Tags para la instancia"
  type        = map(string)
}

variable "security_group_ids" {
  description = "Lista opcional de security groups"
  type        = list(string)
  default     = []
}