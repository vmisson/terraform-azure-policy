variable "policy_definition_name" {
  type = string
}

variable "management_group_id" {
  type = string
}

variable "management_group_name" {
  type = string
}

variable "parameters" {
  type    = string
  default = null
}

variable "enforce" {
  type    = bool
  default = true
}