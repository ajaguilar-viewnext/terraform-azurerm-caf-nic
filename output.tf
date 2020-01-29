output "object" {
  description = "Output the networking interfaces as a full object (azurerm_network_interface.nic)"
  value       = azurerm_network_interface.nic
}

output "id" {
  description = "id of the nic"
  value       = azurerm_network_interface.nic.id
}