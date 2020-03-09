# A sample terraform configuration to demonstrate usage of for_each to have multiple resource instances defined by a Map or Set of strings

## Prerequisites

- git
- terraform (>= 0.12.6)
- AWS subscription

## How to use

- Get the repo

```
git clone https://github.com/achuchulev/terraform-for_each.git
cd terraform-for_each
```

- Create `terraform.tfvars` file

```
aws_access_key = "your_aws_access_key"
aws_secret_key = "your_aws_secret_key"
subnet_ids     = ["subnet-xxxxxxx","subnet-yyyyyyy"]
```

- Initialize terraform and plan/apply

```
terraform init
terraform plan
terraform apply
```

- `Terraform apply` will:
  - create 2 new S3 buckets for each environment (Dev and Prod)
  - create 2 new EC2 instances each within the specified subnet
