terraform init
terraform plan
terraform plan -var "var=value" # Setting a var in command line
terraform apply
terraform graph
terraform output # List all defined outputs
terraform output variable_name # Rtrieve the value of a specific output
public_ip=$(terraform output -raw public_ip) # Putting output variables into env variables

# ==============
# LOCAL GIT REPO
# ==============

# Create a local git repo for terraform
git init
git add main.tf .terraform.lock.hcl
git commit -m "Initial commit"
# You should also create a .gitignore file with the following contents: .terraform *.tfstate *.tfstate.backup
git add .gitignore
git commit -m "Add a .gitignore file"
git remote add origin git@github.com:<YOUR_USERNAME>/<REPOSITORY_NAME>.git
git push origin main
git pull origin main

