resource "azurerm_subnet" "this" {
  count = var.create_subnets ? 1 : 0

  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  dynamic "delegation" {
    for_each = var.delegation

    content {
      name = try(delegation.value.name)
      dynamic "service_delegation" {
        for_each = try(delegation.value.service_delegation)

        content {
          name    = try(service_delegation.value.name)
          actions = try(service_delegation.value.actions, [])
        }

      }

    }
  }
  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoints                             = var.service_endpoints
  service_endpoint_policy_ids                   = var.service_endpoint_policy_ids

}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count          = var.associate_nat_gateway ? 1 : 0
  subnet_id      = azurerm_subnet.this[0].id
  nat_gateway_id = var.nat_gateway_id
}

resource "azurerm_subnet_network_security_group_association" "this" {
  count                     = var.associate_nsg ? 1 : 0
  subnet_id                 = azurerm_subnet.this[0].id
  network_security_group_id = var.network_security_group_id
}