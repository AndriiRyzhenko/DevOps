output "ec_hostname" {
  value = module.ec2_private.hostname
}

output "ec_id" {
  value = module.ec2_private.id
}

output "ec_public_ip" {
  value = module.ec2_public.public_ip
}