instance_type = "t3.micro"

#perferences 
#1. command line variable --> issue variable in command line
#2. terraform.tfvars --> variable in .tfvars file
#3. Environment variable --> to create env variable --> export TF_VAR_v_instance_type="t3.large" ; to remove env variable --> unset TF_VAR_instance_type
#4. default variable --> variable present in variables.tf
#5. in above all cases if we dint provide value for a variable then it will ask for the value in prompt i.e., in the command line
variable "ami_id" {
   type = string # we will mention type here even if we dont provide a default value because, if we want to take var value as input from users then they should know that which value should they provide or if we share our code then they will replace their required values (it is not mandatory to keep type but it is just for our convience)
   #default = "ami-0220d79f3f480ecf5"
}