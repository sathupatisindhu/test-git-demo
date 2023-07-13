# Create the route table for the public subnets
resource "aws_route_table" "web-RT" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "web-RT"
  }
}

# Associate the public subnets with the public route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.web-public-subnet-1.id
  route_table_id = aws_route_table.web-RT.id
}

# Create the route table for the private subnets
resource "aws_route_table" "app-RT" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "app-RT"
  }
}

# create the app subnet association with the private route table
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.application-private-subnet-1.id
  route_table_id = aws_route_table.app-RT.id
}

# create the app subnet association with the private route table
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.db-private-subnet-1.id
  route_table_id = aws_route_table.app-RT.id
}
