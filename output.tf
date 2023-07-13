output "instance_id" {
  description = "ID of the ec2 instances"
  value       = aws_instance.bastion1.id
}

output "instance_id_addr" {
  description = "public ip address of the ec2 instances"
  value       = aws_instance.bastion1.public_ip
}

output "lb_dns_name" {
  description = "the DNS name of the load balancer"
  value       = aws_lb.external-elb.dns_name
}
