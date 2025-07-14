variable "name" {}
variable "container_image" {}
variable "execution_role_arn" {}
variable "task_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_id" {}
variable "target_group_arn" {}
