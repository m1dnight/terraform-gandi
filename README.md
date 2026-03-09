# Terraform Gandi DNS

Terraform project to update DNS records on Gandi.

## 1Password Service Account

Generate a service account with

```shell
 op service-account create terraform --expires-in 1w --vault Infra:read_items
```

then save it in the shell

```shell
# mind the space to not have it in history
 export TF_VAR_op_service_account_token="your-token"
```

## Run

```bash
terraform init
terraform refresh
terraform plan
terraform apply
```