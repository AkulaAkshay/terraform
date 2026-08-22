resource "aws_instance" "terraform" {
    #key, value --> are nothing but arguments
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name = "Terraform control"
    Terraform = "true"
  }

  provisioner "local-exec" {
    command = "echo The server's PRIVATE-IP address is ${self.private_ip} > inventory"
    on_failure = continue # if the shell comannd is failed, still aws resource will be created
  }

  provisioner "local-exec" {
    command = "echo Instance is destroyed"
    when = destroy
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"     # Local path to your private key
    host        = self.public_ip           # 'self' references parent attributes without loop errors
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
   ]
  }

  provisioner "remote-exec" { #destroy -->servers are removed immedietely then, present users get interreputed. inorder to not to disturb the present users and stop accepting the new connections and after serving to all the exisisting customers we can destroy the server. for this we use stop the server
    inline = [
      "sudo systemctl stop nginx -y",
      "echo 'successfully stopped the nginx' "
   ]
   when = destroy #firstly it stops the server and then destroy the server
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
    from_port       = 0 
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
  }

  tags = {
    Name = "Terraform-sg" #name --> for user display; in aws console 
  }
}