
variable "aws_region" {
  description = "AWS region where the EC2 server exists"
  type        = string
}

variable "instance_id" {
  description = "Existing EC2 instance to import"
  type        = string
}

variable "ami_id" {
  description = "AMI currently used by the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Existing subnet containing the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource tags"
  type        = string
  default     = "task-manager"
}
