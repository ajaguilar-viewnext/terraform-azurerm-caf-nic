output "object" {
  description = "Output the networking interface as a full object (azurerm_network_interface.nic)"
  value       = module.test_nic.object
}

output "id" {
  description = "ID of the networking card"
  value = module.test_nic.id
}