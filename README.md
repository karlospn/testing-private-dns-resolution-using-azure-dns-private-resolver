# Testing private resources DNS resolution over an Azure P2S VPN connection using Azure DNS Private Resolver

The purpose of this repository is to test the new Azure DNS Private Resolver resource.

To test it, we're going to try to resolve the DNS of a few private Azure resources when we're connected to an Azure Point-to-Site VPN connection.

Here's a diagram of what we're going to build:

![Alt Text](https://raw.githubusercontent.com/karlospn/testing-private-dns-resolution-using-azure-dns-private-resolver/main/docs/architecture-diagram.png)


Every resource in Azure is deployed using Terraform.    
This repository uses the following Terraform providers:
- [AzureRM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) Terraform provider.
- [AzApi](https://registry.terraform.io/providers/Azure/azapi/latest/docs) Terraform provider.

The AzApi provider is needed because right now there is no way to dpeloy an Azure DNS Private Resolver using the official AzureRM provider.
