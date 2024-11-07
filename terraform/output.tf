output "simpsons_repo" {
  value = aws_ecr_repository.simpsons.repository_url
}
output "alb_url" {
  value = aws_lb.app_alb.dns_name
}

output "endpoint" {
  value = aws_route53_record.simpsons_dns.fqdn
}
