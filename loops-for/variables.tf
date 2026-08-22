variable "instances" {
    type = list
    default = [ "mongodb", "redis", "mysql", "rabbitmq" ]
    # type = map
    # # default = {

    # #     mongodb = "t2.micro"
    # #     redis = "t2.micro"
    # #     mysql = "t3.micro"
    # #     rabbitmq = "t2.small"
    # # }
}

#for_rach --> for_each based loop ; it works well for map items

variable zone_id {
    default = "Z02237942WL8S6DN4RI1T"
}

variable domain_name {
    default = "akshaysunny.space"
}