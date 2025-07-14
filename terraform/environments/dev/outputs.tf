output "app_url" {
  value = "http://${module.alb.alb_dns_name}"
}

output "ecr_url" {
  value = module.ecr.repository_url
}
