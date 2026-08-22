locals {
    instance_type = "t3.micro"
    common_name = "${var.project}-${var.environment}" #roboshop-dev
    ami_id = data.aws_ami.joindevops.id
    ec2_tags = merge (
        var.common_tags,
        {
            Name = "${local.common_name}-local-demo"
        }
    )
}

# locals
# locals are like variables but has many other extra capabilities
# 1. variables can be overriden but locals can't be overriden
# 2. we can't use one variable inside a another variable (var1 can't be called inside var2) but we can call a variable inside locals and we can call local inside local also
# 3. we can store expressions or functions inside locals and we can use whenever we require it