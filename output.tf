# for count meta argument
#for single instance
#output "ec2_public_ip" {
#    value = aws_instance.terraform_instance.public_ip
#}

#for multi instance
#output "ec2_public_ip" {
#    value = aws_instance.terraform_instance[*].public_ip
#}

#output "ec2_public_dns" {
#    value = aws_instance.terraform_instance.public_dns
#}

#output "ec2_private_ip" {
#    value = aws_instance.terraform_instance.private_ip
#}

# for for_each arguments

#output "ec2_private_ip"{
 #   value = [
  #      for instance in aws_instance.terraform_instance : instance.public_ip
   # ]
#}