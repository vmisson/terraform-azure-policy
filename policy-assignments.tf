module "root-BuiltInPolicies" {
  source = "./modules/policy/management_group/multi_policy_assignments"

  management_group_name = azurerm_management_group.management_group_contoso.name
  management_group_id   = azurerm_management_group.management_group_contoso.id

  policy_definition_names = [
    "Network interfaces should not have public IPs",
    "Network interfaces should disable IP forwarding",
    "[Preview]: All Internet traffic should be routed via your deployed Azure Firewall",
    "Linux virtual machines should have Azure Monitor Agent installed",
    "Windows virtual machines should have Azure Monitor Agent installed"
    ]
}

module "root-AllowedLocations-BuiltInPolicy" {
  source = "./modules/policy/management_group/policy_assignment"

  management_group_name = azurerm_management_group.management_group_contoso.name
  management_group_id   = azurerm_management_group.management_group_contoso.id

  policy_definition_name = "Allowed locations"
  
  parameters = jsonencode({
    listOfAllowedLocations = {
      value = ["westeurope", "francecentral"]
    }
  })

}

module "root-FlowLogs-BuiltInPolicy" {
  source = "./modules/policy/management_group/policy_assignment"

  management_group_name = azurerm_management_group.management_group_contoso.name
  management_group_id   = azurerm_management_group.management_group_contoso.id

  policy_definition_name = "Flow logs should be enabled for every network security group"
  enforce                = false
}