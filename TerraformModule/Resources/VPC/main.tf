resource "aws_vpc" "this_vpc" {
  cidr_block= var.this_vpc_cidr_block
}
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.this_vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  // Allow traffic from any source
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  // Allow traffic to any destination
  }
}
resource "aws_security_group" "this_sg" {
    vpc_id= aws_vpc.this_vpc.id 
    name = "this_sg"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3306
        to_port = 3306 
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443 
        to_port = 443 
        protocol = "TCP" 
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.public_cidr_block
    availability_zone = var.public_az
    tags = {
        Name = "public"
    }
    map_public_ip_on_launch = var.map_public_ip_on_launch1
}
resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.public2_cidr_block
    availability_zone = var.public2_az
    tags = {
        Name = "public2"
    }
    map_public_ip_on_launch = var.map_public_ip_on_launch1
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.private_cidr_block
    availability_zone = var.private_az
    tags = {
        Name = "private"
    }
    map_public_ip_on_launch = var.map_public_ip_on_launch2
}
resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.this_vpc.id  
    cidr_block = var.private2_cidr_block
    availability_zone = var.private2_az
    tags = {    
        Name = "private2"
    }
    map_public_ip_on_launch = var.map_public_ip_on_launch2 
}
resource "aws_internet_gateway" "this_igw" {
    vpc_id = aws_vpc.this_vpc.id
    tags = {
        Name = "igw"
    }
}
resource "aws_default_route_table" "default" {
default_route_table_id = aws_vpc.this_vpc.default_route_table_id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.this_igw.id
  }
}

resource "aws_route_table_association" "route1" {
   subnet_id      = aws_subnet.public.id
   route_table_id = aws_default_route_table.default.id
}
resource "aws_route_table_association" "route2" {
   subnet_id      = aws_subnet.public2.id
   route_table_id = aws_default_route_table.default.id
}
resource "aws_eip" "eip1" {
    domain = "vpc"
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip1.id
    subnet_id = aws_subnet.public.id
    tags = {
        Name = "nat"
    }
}
resource "aws_route_table" "this_rt" {
    vpc_id = aws_vpc.this_vpc.id  
    route {
        cidr_block = var.route_cidr_block
        nat_gateway_id = aws_nat_gateway.nat.id  
    }
    tags = {
        Name = "rt"
    }
}
resource "aws_route_table_association" "route3" {
    subnet_id = aws_subnet.private.id  
    route_table_id = aws_route_table.this_rt.id
}
resource "aws_route_table_association" "route4" {
    subnet_id = aws_subnet.private2.id  
    route_table_id = aws_route_table.this_rt.id
}
