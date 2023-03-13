resource "random_id" "this" {
  byte_length = 16
}

resource "azurerm_resource_group_policy_exemption" "this" {
  name                 = random_id.this.id
  display_name         = var.name
  resource_group_id    = var.resource_group_id
  policy_assignment_id = var.policy_assignment_id
  exemption_category   = var.exemption_category
  expires_on           = var.expires_on
  description          = var.description
}