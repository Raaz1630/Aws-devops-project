variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "projectkeys"
}

variable "subnet_id" {
  default = "subnet-00a950245cf71a11b"
}

variable "vpc_security_group_ids" {
  default = "sg-06d79fa88b705cd2e"
}
