####
##
##  Infrastructure Provisioning Scripts
##
####

terraform init
terraform plan -out tfplan .
terraform apply -auto-approve tfplan
