variable "prefix" {

}

variable "tags" {

}

variable "resource_groups" {
  description = "(Required) Specifies the name of the Resource Groups as per https://github.com/aztfmod/terraform-azurerm-caf-resource-group/blob/master/README.md#resource_groups."
}

variable "location" {
  description = "(Required) Specifies the Azure Region where the nic is deployed. Changing this forces a new resource to be created."
}

variable "nic_objects" {
  description = "(Required) "
}

variable "pip_objects" {
  default = null
}