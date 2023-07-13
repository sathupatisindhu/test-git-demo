#creating the bastion server 

resource "aws_instance" "bastion1" {
  ami                    = "ami-0d13e3e640877b0b9"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.Web-sg.id]
  subnet_id              = aws_subnet.web-public-subnet-1.id
  user_data              = file("install.httpd.sh")
  monitoring = true
  ebs_optimized = true

  tags = {
    Name = "bastion1"
  }
}

#creating the multiple ec2 instances 

resource "aws_instance" "appserver-1" {
  count                  = 2
  ami                    = "ami-0d13e3e640877b0b9"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.Web-sg.id]
  subnet_id              = aws_subnet.application-private-subnet-1.id
  user_data              = file("install.httpd.sh")
  monitoring = true
  ebs_optimized = true
  
  tags = {
    Name = "app-1"
  }
}

resource "aws_instance" "appserver-2" {
  count                  = 2
  ami                    = "ami-0d13e3e640877b0b9"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.Web-sg.id]
  subnet_id              = aws_subnet.application-private-subnet-1.id
  user_data              = file("install.httpd.sh")

  tags = {
    Name = "app-2"
  }
}


resource "aws_instance" "dbserver1" {
  ami                    = "ami-0d13e3e640877b0b9"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.Web-sg.id]
  subnet_id              = aws_subnet.db-private-subnet-1.id
  user_data              = file("install.httpd.sh")

  tags = {
    Name = "db server1"
  }
}
