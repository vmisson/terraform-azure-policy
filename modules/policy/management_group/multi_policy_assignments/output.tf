output "id" {
  value = tomap({
    for k, assignment in azurerm_management_group_policy_assignment.this : k => assignment.id
  })
}