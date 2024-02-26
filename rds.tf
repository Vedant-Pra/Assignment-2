resource "aws_subnet" "subnet-a" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a" # Replace with your desired AZ
    tags = {
        Name = "Subnet-A"
    }
}
resource "aws_subnet" "subnet-b" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b" # Replace with your desired AZ
    tags = {
        Name = "Subnet-B"
    }
}
# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_subnet_route_table_assoc1" {
    subnet_id         = aws_subnet.subnet-a.id
    route_table_id    = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_route_table_assoc2" {
    subnet_id         = aws_subnet.subnet-b.id
    route_table_id    = aws_route_table.public_route_table.id
}
resource "aws_db_subnet_group" "rds_group" {
  name       = "subnet_group_vedant"
  subnet_ids = [aws_subnet.subnet-a.id, aws_subnet.subnet-b.id]
  tags = {
    Name = "RDS subnet group"
  }
}
resource "aws_db_instance" "RDS" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
  db_subnet_group_name = aws_db_subnet_group.rds_group.name
  vpc_security_group_ids = [aws_security_group.ssh.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
  multi_az = false
  tags = {
    Name = "RDS database"
  }
}