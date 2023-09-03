# Create main VPC
resource "aws_vpc" "timezone_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

# Create two public subnets
resource "aws_subnet" "public_subnet" {
  count             = 2
  vpc_id            = aws_vpc.timezone_vpc.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = var.availability_zone[count.index]
  map_public_ip_on_launch = true
}

# Create security groups
resource "aws_security_group" "default_sg" {
  name        = "default_sg"
  description = "default security group"
  vpc_id      = aws_vpc.timezone_vpc.id

}
# Create routing tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.timezone_vpc.id
}

# Associate subnets with routing tables
resource "aws_route_table_association" "public_subnet_association" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}


# Create an Internet Gateway
resource "aws_internet_gateway" "timezone_igw" {
  vpc_id = aws_vpc.timezone_vpc.id
}

# Attach the Internet Gateway to the Routing Table (for public subnets)
resource "aws_route" "internet_gateway_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0" # All traffic
  gateway_id                = aws_internet_gateway.timezone_igw.id
}