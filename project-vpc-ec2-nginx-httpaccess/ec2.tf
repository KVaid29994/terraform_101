resource "aws_instance" "nginx_server" {
    ami= "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet1.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.web_nginx_sg.id]
    
    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable nginx1
              yum install -y nginx
              systemctl enable nginx
              systemctl start nginx

              # Remove default page
              rm -f /usr/share/nginx/html/index.html

              # Create custom index.html
              echo "<!DOCTYPE html>
              <html>
              <head>
                <title>My Static Website</title>
                <link rel='stylesheet' href='style.css'>
              </head>
              <body>
                <h1>Welcome to My Static Website!</h1>
                <p>Hosted on EC2 + NGINX + Terraform 🚀</p>
              </body>
              </html>" > /usr/share/nginx/html/index.html

              # Create custom style.css
              echo "body { font-family: Arial; background-color: #f4f4f4; text-align: center; } 
              h1 { color: green; } 
              p { color: #333; }" > /usr/share/nginx/html/style.css
              EOF
    
  tags = {
    Name = "NginxServer"
  }
  
}
