output "ecr_repository_url" {
  value = aws_ecr_repository.pulsecheck.repository_url
}

output "alb_dns_name" {
  value = aws_lb.pulsecheck.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.pulsecheck.name
}
