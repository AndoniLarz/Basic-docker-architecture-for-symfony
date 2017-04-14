# This is the symfony container's Dockerfile. It stores the application's code.
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    # curl \ Uncomment this if you plan on using curl in your server architecture
    php5-cli \
    php5-json \
    php5-intl \
    php5-gd
    # I think we can remove these since it's the FPM container that handles the PHP commands. Need to test.

# We can remove this too, need to test before.
RUN curl -sS https://getcomposer.org/installer | php # If we remove php, it won't work
RUN mv composer.phar /usr/local/bin/composer

# I feel like this is only useful to clear the cache and set the correct rights on it
ADD entrypoint.sh /entrypoint.sh 
# This adds the app's files to the container. It's the main goal of this container
ADD ./ /var/www

# Set the workdir correctly for commands to be run directly in the project's directory if we docker run some command
WORKDIR /var/www

# Set the command that is run when the container is launched
ENTRYPOINT ["/entrypoint.sh"]

# Can remove this too. Need to test.
CMD ["echo", "hello"]
