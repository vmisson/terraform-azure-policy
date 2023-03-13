module "contoso-CISBenchmark" {
  source = "./modules/policy/management_group/policy_set_assignment"

  management_group_name = azurerm_management_group.management_group_contoso.name
  management_group_id   = azurerm_management_group.management_group_contoso.id

  policy_set_definition_name = "CIS Microsoft Azure Foundations Benchmark v1.4.0"
}