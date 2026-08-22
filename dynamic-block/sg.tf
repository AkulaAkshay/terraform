# resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
#   name = "allow-all-sg" #allow-all-sg --> security group name; in aws console.

#   egress { #outgoing traffic
#     from_port       = 0 #from_port 0 to to_port 0 means all ports
#     to_port         = 0
#     protocol        = "-1" #-1 means all protocols
#     cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 means internet
#   }

#   ingress { #incomming traffic
#     from_port       = 8080 
#     to_port         = 8080
#     protocol        = "-1" #-1 means all protocols
#     cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
#   }
#   ingress { #incomming traffic
#     from_port       = 22 
#     to_port         = 22
#     protocol        = "-1" #-1 means all protocols
#     cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
#   }
#   ingress { #incomming traffic
#     from_port       = 3306 #from_port 0 to to_port 0 means all ports
#     to_port         = 3306
#     protocol        = "-1" #-1 means all protocols
#     cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
#   }

#   tags = {
#     Name = "Terraform-sg" #name --> for user display; in aws console 
#   }

# }


resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
  name = "roboshop-strict-sg" #allow-all-sg --> security group name; in aws console.

  egress { #outgoing traffic
    from_port       = 0 #from_port 0 to to_port 0 means all ports
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 means internet
  }

#block --. whcih has no key,value 
  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port       = ingress.value #here ingress is the specisl keyword
      to_port         = ingress.value
      protocol        = "tcp" 
      cidr_blocks     = ["0.0.0.0/0"] 
    }
  }
  tags = {
    Name = "roboshop-strict-sg"
  }
}