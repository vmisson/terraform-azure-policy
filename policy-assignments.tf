module "landingzones-BuiltInPolicies" {
  source = "./modules/policy/management_group/multi_policy_assignments"

  management_group_name = azurerm_management_group.management_group_landingzones.name
  management_group_id   = azurerm_management_group.management_group_landingzones.id

  policy_definition_names = [
    "Network interfaces should not have public IPs",
    "Network interfaces should disable IP forwarding"
  ]
}

module "connectivity-BuiltInPolicy" {
  source = "./modules/policy/management_group/policy_assignment"

  management_group_name = azurerm_management_group.management_group_platform-connectivity.name
  management_group_id   = azurerm_management_group.management_group_platform-connectivity.id

  policy_definition_name = "[Preview]: All Internet traffic should be routed via your deployed Azure Firewall"
}