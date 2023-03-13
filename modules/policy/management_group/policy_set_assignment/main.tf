
data "azurerm_policy_set_definition" "this" {
  display_name = var.policy_set_definition_name
}

resource "random_id" "this" {
  byte_length = 16
}

resource "azurerm_management_group_policy_assignment" "this" {
  name                 = random_id.this.id
  management_group_id  = var.management_group_id
  policy_definition_id = data.azurerm_policy_set_definition.this.id
  display_name         = "${var.management_group_name} - ${var.policy_set_definition_name}"
}