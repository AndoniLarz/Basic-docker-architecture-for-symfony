FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    nginx

ADD nginx.conf /etc/nginx/nginx.conf # Add the main nginx server configuration file to the container

ADD vhost.conf /etc/nginx/sites-enabled/default # Add the vhost configuration file to the container
ADD start.sh /start.sh # Add the file that contains the command run to get the nginx daemon working in the container

EXPOSE 80 # Expose the HTTP port, which is listend by the vhost

ENTRYPOINT ["/start.sh"] # Set the start.sh file as the first file to exec when the container starts
