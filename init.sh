#!/bin/bash

# Inicializar y aplicar la configuración de bootstrap
cd terraform/bootstrap
terraform init
terraform apply -auto-approve

# Obtener los nombres de los recursos creados
S3_BUCKET=$(terraform output -raw s3_bucket_name)
DYNAMODB_TABLE=$(terraform output -raw dynamodb_table_name)

# Verificar si el bucket existe antes de continuar
while ! aws s3api head-bucket --bucket "$S3_BUCKET" 2>/dev/null; do
  echo "Esperando a que el bucket $S3_BUCKET esté disponible..."
  sleep 10
done

# Volver al directorio principal de Terraform
cd ../

# Inicializar el backend principal
terraform init \
  -backend-config="bucket=$S3_BUCKET" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="region=us-east-1" \
  -backend-config="dynamodb_table=$DYNAMODB_TABLE"

# Crear workspaces para QA y Producción
terraform workspace new qa
terraform workspace new prod
terraform workspace select default

echo "Inicialización completa. Workspaces 'qa' y 'prod' creados."
echo "Usa 'terraform workspace select qa' o 'terraform workspace select prod' para cambiar entre entornos."
echo "Luego, puedes ejecutar 'terraform apply' en el workspace deseado."cd 