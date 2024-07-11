# nat gateway

## TODO: convert to NAT instance to save $$
## https://www.reddit.com/r/aws/comments/1b83lu1/comment/ktpyw13/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

resource "aws_nat_gateway" "wordpress" {
  count             = 2
  depends_on        = [aws_eip.eip_001, aws_subnet.public_subnets[0], aws_subnet.public_subnets[1]]
  allocation_id     = aws_eip.eip_001[count.index].id
  subnet_id         = aws_subnet.public_subnets[count.index].id
  connectivity_type = "public"
  tags = {
    Name = "${var.azs[count.index]} Nat_Gateway"
  }
}

resource "aws_eip" "eip_001" {
  count  = 2
  domain = "vpc"
  tags = {
    Name = "WordPress - Nat_GateWay_EIP"
  }
}