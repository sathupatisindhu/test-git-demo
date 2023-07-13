#created the nat gateway 

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.web-public-subnet-1.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.igw]
} 

# Create the Elastic IP for nat gateway
resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "nat1"
  }
}
