variable "db_name" { type = string }
variable "username" { type = string }
variable "password" { type = string }
variable "allocated_storage" { type = number, default = 20 }
variable "engine_version" { type = string, default = "15.3" }
variable "instance_class" { type = string, default = "db.t3.micro" }