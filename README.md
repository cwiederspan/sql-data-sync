# SQL Data Sync Overview

## Create Databases

Create a secret.tfvars file.

```terraform
resource_group_Name = "my-datasync-20190220"
primary_location    = "westus2"
secondary_location  = "westcentralus"

server_name_1 = "my-svrnode1-20190220"
server_name_2 = "my-svrnode2-20190220"

database_name = "MyData"

db_username   = "sqlsa"
db_password   = "something"

blob_uri      = "https://cdwms.blob.core.windows.net/deployment/data-sync-demo-source.bacpac"
blob_password = "biglongkeygoeshere"
```

Use Terraform to create the database and import a .bacpac file to see the schema and data.

```bash
terraform init
terraform plan -var-file=secret.tfvars
terraform apply -var-file=secret.tfvars
```

## Setup Data Sync

