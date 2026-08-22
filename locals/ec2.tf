resource "aws_instance" "terraform" {
    #key, value --> are nothing but arguments
  ami  = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]


  # tags = merge (   # this is a function ca be kept inside locals
  #   var.common_tags,
  #   {
  #      Name = "${local.common_name}-local-demo"
  #   }
  # )
  tags = local.ec2_tags

}

resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
  name = "${local.common_name}-allow-all"

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

  tags = merge (
    var.common_tags,
    {
      Name = "${local.common_name}-allow-all"
    }
  )

}