variable "create_subnets" {
  type        = bool
  description = "Do you want to create subnet"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
}

variable "virtual_network_name" {
  type        = string
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
}

variable "address_prefixes" {
  type        = list(string)
  description = "(Required) The address prefixes to use for the subnet."
}

variable "delegation" {
  type        = any
  description = "(Optional) One or more delegation blocks"
  default     = []
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
  default     = true
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
  default     = true
}

variable "service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, and Microsoft.Web."
  default     = null
}

variable "service_endpoint_policy_ids" {
  type        = list(string)
  description = "(Optional) The list of IDs of Service Endpoint Policies to associate with the subnet."
  default     = null
}

variable "associate_nat_gateway" {
  type        = bool
  description = "(Optional) Do you want to associate NAT Gateway to subnets"
  default     = false
}

variable "nat_gateway_id" {
  type        = string
  description = "(Optional) The ID of the NAT Gateway which should be associated with the Subnet. Changing this forces a new resource to be created."
  default     = null
}

variable "associate_nsg" {
  type        = bool
  description = "(Optional) Do you want to associate nsg with subnet"
  default     = true
}

variable "network_security_group_id" {
  type        = string
  description = "(Required) The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new resource to be created."
  default     = null
}
