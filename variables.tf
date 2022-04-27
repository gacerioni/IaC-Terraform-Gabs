variable "bucket_prefix" {
    type        = string
    description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
    default     = ""
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
