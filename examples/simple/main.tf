module "subnet" {
  source                = "../.."
  name                  = "test-subnet"
  resource_group_name   = "terraform-test"
  virtual_network_name  = "terraform-test"
  address_prefixes      = ["10.0.1.0/24"]
  service_endpoints     = ["Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.ContainerRegistry", "Microsoft.EventHub", "Microsoft.Storage"]
  associate_nat_gateway = true
  nat_gateway_id        = "/subscriptions/3136ec69-c7c7-4d73-ae13-44f44207a83f/resourceGroups/terraform-test/providers/Microsoft.Network/natGateways/terraform-test"
}