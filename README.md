# Testing private resources DNS resolution over an Azure P2S VPN connection using Azure DNS Private Resolver

The purpose of this repository is to test the new Azure DNS Private Resolver resource.

To test it, we're going to try to solve the DNS of a few private Azure resources when we're connected to an Azure Point-to-Site VPN connection.

Here's a diagram of what we're going to build:

![Alt Text](https://raw.githubusercontent.com/karlospn/testing-private-dns-resolution-using-azure-dns-private-resolver/main/docs/architecture-diagram.png)


Every resource in this repository is deployed using Terraform.    
This repository uses the following Terraform providers:
- [AzureRM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) Terraform provider.
- [AzApi](https://registry.terraform.io/providers/Azure/azapi/latest/docs) Terraform provider.

The AzApi provider is needed because right now there is no way to deploy an Azure DNS Private Resolver using the official AzureRM provider.

# How to deploy it

If you want to deploy the contents of this repository on your subscription, there are a couple of extra steps you'll need to do before deploy it using Terraform.

The VPN P2S uses AAD as method of authentication, so you'll need to create an app on AAD and set it up properly. Here's the docuemntation of how to do it:
- https://docs.microsoft.com/en-us/azure/vpn-gateway/openvpn-azure-ad-tenant

Once you've created and setup the application on the AAD, you'll need to retrieve the tenantID and the App ClientId and replace the following variables in the [dev.tfvars](https://github.com/karlospn/testing-private-dns-resolution-using-azure-dns-private-resolver/blob/main/tf/src/environments/dev.tfvars) file:

- vpn_gw_aad_tenant 
- vpn_gw_aad_audience 
