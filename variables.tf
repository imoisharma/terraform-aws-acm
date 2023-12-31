variable "domain_name" {
  description = "(Required) Domain name for which the certificate should be issued"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = "Optional) Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = " (Optional) Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform.."
  type        = string
  default     = "DNS"

  validation {
    condition     = contains(["DNS", "EMAIL", "NONE"], var.validation_method)
    error_message = "Valid values are DNS, EMAIL or NONE."
  }
}

variable "key_algorithm" {
  type        = string
  description = "(Optional) Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data."
  default     = null
}

variable "certificate_transparency_logging_preference" {
  type        = bool
  description = "(Optional) Whether certificate details should be added to a certificate transparency log. Valid values are ENABLED or DISABLED. See https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency for more details."
  default     = true
}

variable "validation_option" {
  type = any
  description = "Supported nested arguments for the validation_option configuration block: domain_name - (Required) Fully qualified domain name (FQDN) in the certificate. validation_domain - (Required) Domain name that you want ACM to use to send you validation emails. This domain name is the suffix of the email addresses that you want ACM to use. This must be the same as the domain_name value or a superdomain of the domain_name value. For example, if you request a certificate for testing.example.com, you can specify example.com for this value."
  default = {}
}