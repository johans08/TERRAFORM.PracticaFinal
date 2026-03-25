variable "region" {
  description = "Mapa de regiones por workspace"
  type        = map(string)

  default = {
    dev  = "us-east-1"
    prod = "us-east-2"
  }
}

variable "ami" {
  description = "Mapa de AMIs por workspace"
  type        = map(string)

  default = {
    dev  = "ami-033b95fb8079dc481"
    prod = "ami-0b614a5d911900a9b"
  }
}

variable "instancia" {
  description = "Tipo de instancia por workspace"
  type        = map(string)

  default = {
    dev  = "t3a.nano"
    prod = "t3a.micro"
  }
}

variable "vpc_cidr" {
  description = "CIDR de la VPC por workspace"
  type        = map(string)

  default = {
    dev  = "10.0.0.0/24"
    prod = "10.0.0.0/24"
  }
}

variable "subnet_cidr" {
  description = "CIDR de la Subnet por workspace"
  type        = map(string)

  default = {
    dev  = "10.0.0.0/28"
    prod = "10.0.0.0/28"
  }
}

variable "tags" {
  description = "Tags globales del proyecto"
  type        = map(string)

  default = {
    owner = "Johans-Valverde"
  }
}