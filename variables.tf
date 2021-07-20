variable "ec2-size" {
  type = string
  description = "The size of your EC2 instance, like t3a.micro."
}

variable "key-pair" {
    type = string
    description = "The Key-Pair name to SSH into this EC2 Instance."
    default = "gabs_keypair_sa_east_1"
}