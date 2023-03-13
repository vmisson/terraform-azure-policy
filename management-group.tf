###
# Management Organization
# Root Management Group
# -> Contoso
# |--> Plaform
# |  |--> Identity
# |  |--> Management
# |  |--> Connectivity
# |
# |--> LandingZones
# |  |--> Corp
# |
# |--> Decommissioned
# |
# |--> Sandbox

resource "azurerm_management_group" "management_group_contoso" {
  name = "Contoso"
}

resource "azurerm_management_group" "management_group_platform" {
  name                       = "Platform"
  parent_management_group_id = azurerm_management_group.management_group_contoso.id
}

resource "azurerm_management_group" "management_group_platform-identity" {
  name                       = "Identity"
  parent_management_group_id = azurerm_management_group.management_group_platform.id
}

resource "azurerm_management_group" "management_group_platform-management" {
  name                       = "Management"
  parent_management_group_id = azurerm_management_group.management_group_platform.id
}

resource "azurerm_management_group" "management_group_platform-connectivity" {
  name                       = "Connectivity"
  parent_management_group_id = azurerm_management_group.management_group_platform.id
}

resource "azurerm_management_group" "management_group_landingzones" {
  name                       = "LandingZones"
  parent_management_group_id = azurerm_management_group.management_group_contoso.id
}

resource "azurerm_management_group" "management_group_landingzones-corp" {
  name                       = "Corp"
  parent_management_group_id = azurerm_management_group.management_group_landingzones.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "management_group_decommissioned" {
  name                       = "Decommissioned"
  parent_management_group_id = azurerm_management_group.management_group_contoso.id
}

resource "azurerm_management_group" "management_group_sandbox" {
  name                       = "Sandbox"
  parent_management_group_id = azurerm_management_group.management_group_contoso.id
}

####################################################################################
data "azurerm_subscription" "current" {
}

resource "azurerm_resource_group" "rg-application1-prod" {
  name     = "rg-application1-prod"
  location = "West Europe"
}
