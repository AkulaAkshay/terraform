resource "aws_instance" "terraform" {
  for_each = toset(var.instances) #should refer with each.value  
  # for_each = var.instances
  ami           = "ami-0220d79f3f480ecf5"
  #instance_type = each.value
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name = each.key
    Terraform = "true"
  }

}

resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
  name = "allow-all-sg" #allow-all-sg --> security group name; in aws console.

  egress { #outgoing traffic
    from_port       = 0 #from_port 0 to to_port 0 means all ports
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 means internet
  }

  ingress { #incomming traffic
    from_port       = 0 #from_port 0 to to_port 0 means all ports
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
  }

  tags = {
    Name = "Terraform-sg"  # Name, type --> for user display; in aws console
  }

}