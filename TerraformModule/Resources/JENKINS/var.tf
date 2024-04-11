variable "aws_instance_type" {
  type    = string
  default = "t2.medium"
}
variable "key_name"{
  type    = string
  default = "prat"   
}
variable "aws_ami" {
  type    = string
  default = "ami-06c4be2792f419b7b"
}
variable "volume_size" {
  type    = number
  default = 15
}
variable "public_subnet_id" {
  type = string
}
variable "vpc_security_group_ids" {
  type = list(any)
}
