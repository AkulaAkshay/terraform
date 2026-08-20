resource "aws_instance" "terraform" {
    #key, value --> are nothing but arguments
  ami  = var.ami_id
  instance_type = var.v_instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = var.ec2_tags

}

resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
  name = var.sg_name

  egress { #outgoing traffic
    from_port       = var.egress_from_port
    to_port         = var.egress_to_port
    protocol        = var.protocol
    cidr_blocks     = var.cidr
  }

  ingress { #incomming traffic
    from_port       = var.ingress_from_port
    to_port         = var.ingress_to_port
    protocol        = var.protocol
    cidr_blocks     = var.cidr
  }

  tags = {
    Name = "Terraform-sg" #name --> for user display; in aws console 
  }

}