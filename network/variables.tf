variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block de la subnet"
  type        = string
}

variable "tags" {
  description = "Tags para los recursos de red"
  type        = map(string)
}