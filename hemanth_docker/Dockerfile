# pulling the ubuntu
FROM ubuntu
# Adding a email
MAINTAINER cat1337@gmail.com
# Running the command for for update and nginx
RUN apt update -y && apt install nginx -y
# Creating a directory
RUN mkdir /tommy
# Copy the file to remote 
COPY tom /opt/tom
# Exposing the port 80
EXPOSE 80
# Entering the cmd command
 CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
