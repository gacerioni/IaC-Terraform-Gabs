variable "ec2-size" {
  type = string
  description = "The size of your EC2 instance, like t3a.micro."
}

variable "key-pair" {
    type = string
    description = "The Key-Pair name to SSH into this EC2 Instance."
    default = "gabs_keypair_sa_east_1"
}

variable "iamrole" {
    type = string
    description = "The AMI Role to put as Instance Profile for your EC2."
    default = "Ec2FullAccessRole"
}
