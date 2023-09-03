resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  key_algorithm     = var.key_algorithm

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference ? "ENABLED" : "DISABLED"
  }

  dynamic "validation_option" {
    for_each = var.validation_option

    content {
      domain_name       = try(validation_option.value["domain_name"], validation_option.key)
      validation_domain = validation_option.value["validation_domain"]
    }
  }
  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}