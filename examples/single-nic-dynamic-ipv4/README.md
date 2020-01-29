# Single NIC IPv4 dynamic address

Creates a single NIC with a dynamic IPv4 address.

## Usage
To run this example, simply execute: 

```hcl
terraform init
terraform plan
terraform apply
```

Once you are done, just run 
```hcl
terraform destroy
```

## Outputs
| Name | Type | Description | 
| -- | -- | -- | 
| object | string | Output the networking interface as a full object (azurerm_network_interface.nic) |
| id | string | ID of the nic |