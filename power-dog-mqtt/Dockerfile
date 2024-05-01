# Specify your base image from Home Assistant
ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
    apk --update add curl php83 php83-bcmath php83-common php83-dom \
    php83-mbstring php83-openssl php83-phar php83-tokenizer php83-fileinfo\
    php83-simplexml php83-zlib php83-zip php83-xmlwriter php83-fpm php83-json php83-curl php83-xml \
    && ln -s /usr/bin/php83 /usr/bin/php

# Copy your PHP script directory and the shell script
COPY src/ opt/
COPY run.sh /

# Make sure the shell script is executable
RUN chmod a+x /run.sh

# The command to run when the container starts
CMD [ "/run.sh" ]
