variable "bucket_name" {
  type = string
  description = "The name of our bucket"
}

variable "bucket_location" {
  type = string
  default = "us-central1"
}

variable "project_id" {
  type = string
}

variable "storage_class" {
  type = string
}
