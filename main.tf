resource "aws_vpc" "moanavpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "movieanaylst-vpc-mateo"
    Owner = "Endava"
  }
}

resource "aws_subnet" "moanasub" {
  vpc_id = aws_vpc.moanavpc.id
  cidr_block = "10.0.0.0/18"
  map_public_ip_on_launch = true

  tags = {
      Name = "movieanalyst-api-subnet-mateo"
  }
}

resource "aws_internet_gateway" "moanaig" {
  vpc_id = aws_vpc.moanavpc.id

  tags = {
      Name = "movieanalyst-ig-mateo"
  }
}

resource "aws_route_table" "moanaprt" {
  vpc_id = aws_vpc.moanavpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.moanaig.id
  }

  tags = {
    Name = "movieanalyst-public-route-table-mateo"
  }
}

resource "aws_route_table_association" "moanarta" {
  subnet_id = aws_subnet.moanasub.id
  route_table_id = aws_route_table.moanaprt.id
}

resource "aws_security_group" "moanasg" {
  name = "movieanalyst-sg"
  description = "Allows MySQL, API and UI connections."
  vpc_id = aws_vpc.moanavpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

data "aws_ami" "app-ami" {
  most_recent = true
  owners = ["099720109477"]
}

resource "aws_instance" "moanaec2" {
  count = 1
  ami = data.aws_ami.app-ami.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.moanasub.id
  key_name = "movieanalyst"
  vpc_security_group_ids = [aws_security_group.moanasg.id]
  tags = {
      Name = "movieanalyst-api-vm-mateo"
  }
  user_data = file("./scripts/ubuntu-setup-script.sh")
}