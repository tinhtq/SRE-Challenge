output "homer_repo" {
  value = aws_ecr_repository.homer.repository_url
}

output "lisa_repo" {
    value = aws_ecr_repository.lisa.repository_url

}