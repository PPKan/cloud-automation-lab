# Phase2 Terraform Rebuild Lab

This is an basic Azure infrastructure automated by Terraform. Which include following configurations:

1. A resource group
2. A Virtual Network `10.0.0.0/16`
3. Two subnets: `10.0.1.0/24` and `10.0.5.0/24`
4. A Network Security Group with outbound restrictions and setup to `10.0.5.0/24`
5. A key vault

## Concept of Design

The concept of this Azure Infrastructure is to maintain a basic network setup before enabling any virtual instances.

## How does it managed by Terraform

The above-mentioned infrastructure is codified in `main.tf`



