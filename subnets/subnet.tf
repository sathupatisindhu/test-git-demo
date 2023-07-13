# Create the public subnet
resource "aws_subnet" "web-public-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.0/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "web-subnet-1a"
  }
}

# Create the public subnet
resource "aws_subnet" "web-public-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.160/28"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "web-subnet-1b"
  }
}

# Create the private subnet
resource "aws_subnet" "application-private-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.16/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-subnet-1a"
  }
}

# Create the private subnet for DB
resource "aws_subnet" "db-private-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.128/28"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "db-subnet-1a"
  }
}
