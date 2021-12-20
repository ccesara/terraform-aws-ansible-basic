

#
# Basic Deploy using Terraform (AWS) + Ansible
#


### 1 -> Infrastructure Deploy ( Terraform )
cd terraform
terraform apply


### 2 -> Application Deploy ( Ansible )
cd ansible
./deploy.sh nginx
./deploy.sh apache
