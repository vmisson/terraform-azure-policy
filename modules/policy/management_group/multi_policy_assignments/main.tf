data "azurerm_policy_definition" "this" {
  for_each = var.policy_definition_names

  display_name = each.value
}

resource "random_id" "this" {
  for_each = var.policy_definition_names

  byte_length = 16
}

resource "azurerm_management_group_policy_assignment" "this" {
  for_each = var.policy_definition_names

  name                 = random_id.this[each.value].id
  management_group_id  = var.management_group_id
  policy_definition_id = data.azurerm_policy_definition.this[each.value].id
  display_name         = "${var.management_group_name} - ${each.value}"
}