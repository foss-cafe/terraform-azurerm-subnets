output "id" {
  description = "The subnet ID."
  value       = try(azurerm_subnet.this[0].id, "")
}
