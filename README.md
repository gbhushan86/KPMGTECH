# KPMGTECH
Skill Test
# Terraform code to deploy three-tier architecture on azure
**The workflow of How the Code works is Explained in KPMG_ARCH**

1. One virtual network tied to Four subnets.
2. Each subnet will have one virtual machine.
3. Bastion Subnet -> TO connecto to instances in Private subnet.
4. First virtual machine -> allow inbound traffic from internet only.
5. Second virtual machine -> entertain traffic from first virtual machine only and can reply the same virtual machine again.
6. App can connect to database and database can connect to app but database cannot connect to web.


### The Terraform resources will consists of following structure

```
├── main.tf                   // The primary entrypoint for terraform resources.
├── vars.tf                   // It contain the declarations for variables.
├── output.tf                 // It contain the declarations for outputs.
├── terraform.tfvars          // The file to pass the terraform variables values.
```



1. resourcegroup - creating resourcegroup
2. networking - creating azure virtual network and required subnets
3. securitygroup - creating network security group, setting desired security rules and associating them to subnets
4. compute - creating availability sets, Loadbalancer, network interfaces and virtual machines for web and app
5. database - creating database server and database

All the stacks are placed in the modules folder and the variable are stored under **terraform.tfvars**

To run the code you need to append the variables in the terraform.tfvars

Each module consists minimum two files: main.tf, vars.tf

resourcegroup and networking modules consists of one extra file named output.tf

## Deployment

### Steps

**Step 0** `terraform init`

used to initialize a working directory containing Terraform configuration files

**Step 1** `terraform plan`

used to create an execution plan

**Step 2** `terraform validate`

validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc

**Step 3** `terraform apply -var-file=terraform.tfvars`

used to apply the changes required to reach the desired state of the configuration

