variable "region" {
    type        = string
    description = "AWS Region to create the bucket."
    default     = "sa-east-1"
}

variable "global_access_key" {
    type        = string
    description = "AWS IAM Access Key"
}

variable "global_secret_key" {
    type        = string
    description = "AWS IAM Secret Key"
}

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
        environment = "prod"
        terraform   = "true"
    }
}
