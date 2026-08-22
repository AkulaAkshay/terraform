data "aws_ami" "joindevops" {

    owners = ["973714476881"]
    most_recent = true

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

data "aws_instance" "mongodb" {
    instance_id = "i-0ce73b67194698fe0"
}

output "mongodb_instance_id" {
    value = one(data.aws_instance.mongodb.root_block_device).throughput
}

data "aws_instance" "mongodb" {
    instance_id = "i-0ce73b67194698fe0"
}

output "mongodb_instance_id" {
    value = one(data.aws_instance.mongodb.root_block_device).throughput
}

# + mongodb_instance_id = {
#     + ami                         = "ami-0220d79f3f480ecf5"
#     + arn                         = "arn:aws:ec2:us-east-1:644271348441:instance/i-0ce73b67194698fe0"
#     + associate_public_ip_address = true
#     + availability_zone           = "us-east-1a"
#     + credit_specification        = [
#         + {
#             + cpu_credits = "unlimited"
#         },
#     ]
#     + disable_api_stop            = false
#     + disable_api_termination     = false
#     + ebs_block_device            = []
#     + ebs_optimized               = false
#     + enclave_options             = [
#         + {
#             + enabled = false
#         },
#     ]
#     + ephemeral_block_device      = []
#     + filter                      = null
#     + get_password_data           = false
#     + get_user_data               = false
#     + host_id                     = ""
#     + host_resource_group_arn     = ""
#     + iam_instance_profile        = ""
#     + id                          = "i-0ce73b67194698fe0"
#     + instance_id                 = "i-0ce73b67194698fe0"
#     + instance_state              = "running"
#     + instance_tags               = null
#     + instance_type               = "t3.micro"
#     + ipv6_addresses              = []
#     + key_name                    = ""
#     + launch_time                 = "2026-08-21T04:02:51Z"
#     + maintenance_options         = [
#         + {
#             + auto_recovery = "default"
#         },
#     ]
#     + metadata_options            = [
#         + {
#             + http_endpoint               = "enabled"
#             + http_protocol_ipv6          = "disabled"
#             + http_put_response_hop_limit = 1
#             + http_tokens                 = "optional"
#             + instance_metadata_tags      = "disabled"
#         },
#     ]
#     + monitoring                  = false
#     + network_interface_id        = "eni-049f082645d5f0b69"
#     + outpost_arn                 = ""
#     + password_data               = null
#     + placement_group             = ""
#     + placement_group_id          = ""
#     + placement_partition_number  = 0
#     + private_dns                 = "ip-172-31-9-53.ec2.internal"
#     + private_dns_name_options    = [
#         + {
#             + enable_resource_name_dns_a_record    = false
#             + enable_resource_name_dns_aaaa_record = false
#             + hostname_type                        = "ip-name"
#         },
#     ]
#     + private_ip                  = "172.31.9.53"
#     + public_dns                  = "ec2-18-208-203-43.compute-1.amazonaws.com"
#     + public_ip                   = "18.208.203.43"
#     + region                      = "us-east-1"
#     + root_block_device           = [
#         + {
#             + delete_on_termination = true
#             + device_name           = "/dev/sda1"
#             + encrypted             = false
#             + iops                  = 3000
#             + kms_key_id            = ""
#             + tags                  = {}
#             + throughput            = 125
#             + volume_id             = "vol-00e5d96f532e1faf4"
#             + volume_size           = 20
#             + volume_type           = "gp3"
#         },
#     ]
#     + secondary_private_ips       = []
#     + security_groups             = [
#         + "allow-all-sg",
#     ]
#     + source_dest_check           = true
#     + subnet_id                   = "subnet-0576f7638aaffb949"
#     + tags                        = {
#         + Name      = "redis"
#         + Terraform = "true"
#     }
#     + tenancy                     = "default"
#     + timeouts                    = null
#     + user_data                   = null
#     + user_data_base64            = null
#     + vpc_security_group_ids      = [
#         + "sg-0cd080f9d4048336b",
#     ]
# }


