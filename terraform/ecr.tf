resource "aws_ecr_repository" "simpsons" {
  name = "simpsons"
  lifecycle {
    prevent_destroy = false
  }
  force_delete = true

}
