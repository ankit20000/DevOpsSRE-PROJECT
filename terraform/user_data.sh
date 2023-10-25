#!/bin/bash
yum update -y
yum install nginx -y
service nginx start 
systemctl enable nginx
echo "<div><h1>Private server</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>ip address of server</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>$(uname)</h1></div>" >> /usr/share/nginx/html/index.html