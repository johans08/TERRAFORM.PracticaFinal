variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "tags" {
  description = "Tags del security group"
  type        = map(string)
}