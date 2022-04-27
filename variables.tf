variable "instancetype" {
    type        = string
    description = "Please choose your instance type (t2.micro) is the default."
    default     = "t2.micro"
}
variable "acl" {
    type        = string
    description = "(Optional) The canned ACL to apply. Defaults to private. Conflicts with grant."
    default     = "private"
}
variable "tags" {
    type        = map
    description = "(Optional) A mapping of tags to assign to the bucket."
    default     = {
        Name = "ServerGabsTerraformEc2"
        terraform   = "true"
    }
}
