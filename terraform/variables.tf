variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "subdomain" {
  description = "Subdomain for the app"
  default     = "sre"
}

variable "domain" {
  description = "Primary domain"
  default     = "jv-magic.com"
}

variable "route53_zone_id" {
  type = string

}
