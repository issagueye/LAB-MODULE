variable "access_key" {
    type = string
}

variable "secret_access_key" {
    type = string
}
variable "instance_type" {
  type = string
  #default = "t2.micro"
}
variable "image_id" {
  type = string
  default = "ami-0be2609ba883822ec"
}
variable "availability_zone" {
  type = string
  default = "us-east-1a"
}
variable "size" {
  type = number
  default = 40
}
variable "device_name" {
  type = string
  default = "/dev/sdh"
}
variable "ingressrules" {
  type = list(number)
  default = [443, 80]
}
variable "egressrules" {
  type = list(number)
  default = [443, 80]
}
variable "ec2_tag" {
  type = map
  default = {
    "Name" = "LINUXSRV"
    "APPLICATION" = "JBOSS"
    "BUSINESS_UNIT" = "PROD"
  }
}
variable "volume_tag" {
  type = map
  default = {
    "Name" = "VOLUME FOR LINUXSRV"
    "APPLICATION" = "JBOSS"
    "BUSINESS_UNIT" = "PROD"
  }
}