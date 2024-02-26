# # Create an EC2 instance with desired AMI, instance type, security group IDs, subnet ID, and tags

# resource "aws_instance" "webserver" {
# ami           = "ami-0f9c44e98edf38a2b" # Replace with your desired AMI
# instance_type = "t2.micro" # Replace with your desired instance type
# vpc_security_group_ids = [aws_security_group.ssh.id]
# subnet_id = aws_subnet.public.id
# associate_public_ip_address = "true"
# key_name = "TeraformKeyPair"

# tags = {
# Name = "Web Server"
# }


# }

# # Output the public IP address of the instance

# output "public_ip" {
# value = aws_instance.webserver.public_ip
# }