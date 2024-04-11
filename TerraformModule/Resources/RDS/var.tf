variable "aws_db_engine" {
  type    = string
  default = "mysql"
}
variable "aws_db_engine_version" {
  type    = string
  default = "8.0"
}
variable "aws_db_instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "aws_db_master_user_password" {
  type    = string
  default = "12345678"
}
variable "aws_db_master_username" {
  type    = string
  default = "admin"
}
variable "aws_db_name" {
  type    = string
  default = "studentapp"
}
variable "aws_db_port" {
  type    = string
  default = "3306"
}
variable "aws_db_storage_type" {
  type    = string
  default = "gp2"
} 
variable "subnet_ids" {
  type    = list(any)
}
variable "vpc_security_group_ids" {
  type = list(any)
}
