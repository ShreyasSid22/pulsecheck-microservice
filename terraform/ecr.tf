resource "aws_ecr_repository" "pulsecheck" {
  name = "${var.project_name}-repo"

  image_scanning_configuration {
    scan_on_push = true
  }
}
