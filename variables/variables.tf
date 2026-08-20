variable "ami_id" {
   type = string
   default     = "ami-0220d79f3f480ecf5"
}

variable "v_instance_type" {
    type = string
    default     = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "Terraform - demo"
        Terraform = "true"
        Environment = "Dev"
        Project = "Practice"

    }
}

variable "sg_name" {
    type = string
    default = "allow-all"
    #optional to inform what is this variable about
    description = "security group name attached to ec2-instance"
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
    type = number
    default = 0
}

variable "ingress_to_port" {
    type = number
    default = 0
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "egress_from_port" {
    type = number
    default = 0
}

variable "egress_to_port" {
    type = number
    default = 0
}