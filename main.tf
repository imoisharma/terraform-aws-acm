resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  key_algorithm     = var.key_algorithm
  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}