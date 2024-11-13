provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-03753afda9b8ba740" # Replace with a valid Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "MyWebAppInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              echo "<h1>Welcome to My Web App!</h1>" > /usr/share/nginx/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF
}
