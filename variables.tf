variable "azure_region" {
  type    = string
  default = "koreacentral"
}

variable "azurerm_resource_group_name" {
    type    = string
    default = "rgrgrgrg"
}

variable "client_id" {
    type    = string
    default = "00000000-0000-0000-0000-000000000000"
}
variable "client_secret" {
    type    = string
    default = "00000000-0000-0000-0000-000000000000"
}
variable "agent_count" {
    default = 2
}