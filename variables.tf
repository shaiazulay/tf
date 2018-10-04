variable "container_ip" {
  type = "string"
  description = "MySQL docker container IP"
  default = "172.16.79.2"
}

variable "databases_names" {
  type    = "list"
  default = ["data1", "data2", "data3"]
}

variable "usernames_passwords" {
  type    = "map"
  default = {
    "user1" = "pass1"
    "user2" = "pass2"
    "user3" = "pass3"
    "user4" = "pass4"
  }
}
