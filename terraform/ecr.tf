resource "aws_ecr_repository" "homer" {
  name = "homer"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_ecr_repository" "lisa" {
  name = "lisa"
  lifecycle {
    prevent_destroy = false
  }
}
