
resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = {
    Name        = var.project_name
    ManagedBy   = "Terraform"
    Application = "task-manager"
  }

  lifecycle {
    prevent_destroy = true
  }
}
