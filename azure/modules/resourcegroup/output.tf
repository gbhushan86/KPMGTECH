output "resource_group_name" {
    value = azurerm_resource_group.azure-test-rs.name
}

output "location_id" {
    value = azurerm_resource_group.azure-test-rs.location
}
