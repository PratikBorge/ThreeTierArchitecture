variable "this_vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}
variable "public_cidr_block" {
  type = string 
  default = "10.0.1.0/24"
}
variable "public2_cidr_block" {
  type = string
  default = "10.0.2.0/24"
}
variable "private_cidr_block" {
  type = string 
  default = "10.0.3.0/24"
}
variable "private2_cidr_block" {
  type = string 
  default = "10.0.4.0/24"
}

variable "public_az" {
    type = string
    default = "ap-southeast-1a"
}
variable "public2_az" {
    type = string
    default = "ap-southeast-1b"
}
variable "private_az" {
    type = string
    default = "ap-southeast-1b"
}
variable "private2_az" {
  type = string
  default = "ap-southeast-1c"
}
variable "map_public_ip_on_launch1" {
  type = bool
  default = true
}
variable "map_public_ip_on_launch2" {
  type = bool
  default = false
}
variable "route_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}