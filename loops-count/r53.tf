resource "aws_route53_record" "roboshop" {
  count = len(var.instances)
  zone_id = "${var.zone_id}"
  name    = "${var.instances[count.index]}.${var.domain_name}" #interpolation --> concatination
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true #to override the already existed ipaddress.
}

#loops --> count;for
#count --> used when list(data type) iteration --> tf provides reserved keyword "count.index" --> count; when we use count based loop we get output as list instance_output = []; expects list as the i/p and provides list as o/p
#for --> used when map i.e., key-value(data type) iteration  --> tf provides reserved keyword "each.key, each.value" --> each entry is called an "each" --> for_each; when we use for_each based loop we get output as list instances_output = {}; expects map as the i/p and provides map as o/p