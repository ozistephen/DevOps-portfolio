output "app_url" {
  value = "http://${module.alb.alb_dns_name}"
}

output "ecr_url" {
  value = module.ecr.repository_url
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_id
}