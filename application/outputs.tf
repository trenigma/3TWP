output "Website_Address" {
  value = aws_lb.wordpress_alb.dns_name
}

output "vpc_name" {
  value = data.aws_vpc.aws_wordpress.id
}
