name = "devops-portfolio"
region = "eu-west-2"
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs = ["eu-west-2a", "eu-west-2b"]


#container_image = "your-ecr-repo-url"  # We’ll replace this after ECR setup & CI


container_image = "${module.ecr.repository_url}:latest"
