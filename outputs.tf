output "ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2_instance.public_dns
}

output "tags" {
  description = "List of tags"
  value       = module.ec2_instance.tags_all
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2_instance.public_dns
}
