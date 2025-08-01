# key pair

resource "aws_key_pair" "My_key" {
    key_name = "teraform"
    public_key = file("terraform.pub")
}

# vpc and security group

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "terraform_sg" {
    name = "terraform_sg"
    description = "Security group for Terraform EC2 instances"
    vpc_id = aws_default_vpc.default.id  # interpolation
  #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
        description = "SSh Open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
        description = "HTTP Open"
    }

  #outbound rules

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
    description = "Allow all outbound traffic"
  }
}

# instance

resource "aws_instance" "terraform_instance" {
  tags = {
    name = "my_instance"
  }
  ami = "ami-0f918f7e67a3323f0"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
  key_name = aws_key_pair.My_key.key_name
  security_groups = [aws_security_group.terraform_sg.name]  # Use the security group created above
  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }
}