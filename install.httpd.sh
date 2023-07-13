#!/bin/bash
 sudo yum update -y
 sudo yum install -y httpd
 sudo systemctl start httpd.service
 sudo systemctl enable httpd.service
 echo "<h1>Hello world form $(hostname -f)</h1>" > /var/www/html/index.html.sh
