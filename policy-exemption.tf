

module "landingzones-exemption1" {
  source = "./modules/policy/resource_group/resource_group_policy_exemption"

  name                 = "Landing Zone exception - Network interfaces should not have public IPs"
  resource_group_id    = azurerm_resource_group.rg-application1-prod.id
  policy_assignment_id = module.landingzones-BuiltInPolicies.id["Network interfaces should not have public IPs"]
  exemption_category   = "Mitigated"
  expires_on           = "2023-12-31T00:00:00Z"
  description          = "Exception for project XYZ"
}