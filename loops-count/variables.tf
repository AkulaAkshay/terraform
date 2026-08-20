variable "instances" {
    type = list
    default = [ "mongodb", "redis", "mysql", "rabbitmq" ]
}

#count --> count based loop ; it works well for list items

variable zone_id {
    default = "Z02237942WL8S6DN4RI1T"
}

variable domain_name {
    default = "akshaysunny.space"
}