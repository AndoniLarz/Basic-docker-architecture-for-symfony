FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# We install this in order to be able to use add-apt-repository
RUN sudo apt-get update && apt-get install -y \ 
    language-pack-en-base \
    software-properties-common

# We add this repo in order to be able to get the php7.0 libs
RUN sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y \
	git \ 	# You can comment or remove this if you don't plan on using git inside th container.
			# I recommend you use git outside the container, on your own computer, so you can use it without starting the whole docker architecture and for anything else than just this project
	nano \ 	# Edit this if you prefer using another text editor, for example : emacs, vi, vim
    curl \
    php7.0-curl \
    php7.0-cli \
    php7.0-fpm \
    php7.0-json \
    php7.0-intl \
    php7.0-gd \
    php7.0-mysql \
    php7.0-xml \
    php7.0-zip \
    php7.0-mbstring \
    php7.0-apcu

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime # You can customize this to match your own localtime
RUN "date" # This command displays the date, helps you to check if the previous command worked fine

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
RUN composer --version

ADD start.sh /start.sh # Add the file that sets up and starts the PHP service

EXPOSE 9000 # Expose the default PHP port

WORKDIR /var/www # Set the default work directory, in order to get every command run here.
# Remember, this container gets it's volumes from the symfony container

# Useful command to have the fpm server running fine
RUN mkdir /run/php/

ENTRYPOINT ["/start.sh"] # Set the start.sh file as the first file to exec when the container starts
