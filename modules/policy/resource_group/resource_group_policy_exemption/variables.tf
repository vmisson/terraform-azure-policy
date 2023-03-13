variable "name" {
  type = string
}

variable "resource_group_id" {
  type = string
}

variable "policy_assignment_id" {
  type = string
}

variable "exemption_category" {
  type    = string
  default = "Waiver"
}

variable "expires_on" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}
