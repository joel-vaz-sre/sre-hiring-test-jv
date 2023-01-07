####
##
##  Infrastructure Provisioning Scripts
##
####

terraform init
terraform plan -no-color -input=false -out tfplan .
terraform apply -auto-approve tfplan
