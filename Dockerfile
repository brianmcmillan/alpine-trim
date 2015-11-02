###############################################
# Dockerfile to build a base Node.js image
# from Alpine Linux. The major changes are to
# remove extra users and add a few additional
# packages
#
# cd /Users/brianmcmillan/GitHub/alpine-trim
# docker build --force-rm=false -t brianmcmillan01/alpine-trim:0.0.6 .
# docker run -ti --name=alpine-trim-0.0.6 brianmcmillan01/alpine-trim:0.0.6
#
#
# Build w/o cache:
# docker build --force-rm=false --no-cache=true -t brianmcmillan01/alpine-trim:0.0.6 .
# audit file: cd /usr/local/audit/ && ls -l
#
# Notes: add grep per issue in http://bit.ly/1jGN3K0
###############################################

# Set the base image
FROM gliderlabs/alpine:3.2

# Set the maintainer
MAINTAINER <brian.mcmillan.architect@gmail.com>

# Update the package repository
RUN apk update && apk upgrade

############# BEGIN SETUP ####################
# Create system configuration audit
RUN mkdir -p /opt/audit/
COPY audit.sh /opt/audit/
RUN chmod 770 /opt/audit/audit.sh
RUN sh /opt/audit/audit.sh

# Delete unneeded users and groups from the base image
COPY deluser.sh /opt/audit/
RUN chmod 770 /opt/audit/deluser.sh
RUN sh /opt/audit/deluser.sh
RUN rm /opt/audit/deluser.sh

# Disable unnecessary applications from the base image
COPY delbin.sh /opt/audit/
RUN chmod 770 /opt/audit/delbin.sh
RUN sh /opt/audit/delbin.sh
RUN rm /opt/audit/delbin.sh

############# BEGIN INSTALL ####################
# Create application directories
RUN mkdir -p /srv/www/
RUN mkdir -p /var/opt/
# add /var/opt/node, /var/opt/node/log, /var/opt/node/run

# install additional packages
RUN apk add \
  grep
  #openssl

# Run post update system configuration audit
RUN sh /opt/audit/audit.sh

# Clean up apk cache
RUN rm -rf /var/cache/apk/*
############# END INSTALL ####################

CMD ["/bin/sh"]
