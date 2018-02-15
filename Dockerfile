# This is the symfony container's Dockerfile. It stores the application's code.
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	git \
    curl

# This is only useful to clear the cache and start a bash in the container
ADD entrypoint.sh ./entrypoint.sh
# This adds the project's files to the container. It's the main goal of this container
ADD ./ /var/www

# Set the workdir correctly for commands to be run directly in the project's directory if we 'docker run' a command
WORKDIR /var/www

# Set the command that is run when the container is launched
ENTRYPOINT ["/entrypoint.sh"]

# Can remove this too. Need to test.
#CMD ["echo", "hello"]
