###############################################
# Dockerfile to build a base Node.js image
# from Alpine Linux. The major changes are to
# remove extra users and add a few additional
# packages
#
# cd /Users/brianmcmillan/GitHub/alpine-trim
# docker build --force-rm=false -t brianmcmillan01/alpine-trim:0.0.5 .
# docker run -ti --name=alpine-trim-0.0.5 brianmcmillan01/alpine-trim:0.0.5
#
# Notes: add grep per issue in http://bit.ly/1jGN3K0
###############################################

# Set the base image
FROM gliderlabs/alpine:3.2

# Set the maintainer
MAINTAINER <brian.mcmillan.architect@gmail.com>

# Update the package repository
RUN apk update && apk upgrade

# Create system configuration audit
COPY audit.sh /tmp/
RUN chmod 770 /tmp/audit.sh
RUN mkdir /usr/local/audit/ -p
RUN sh /tmp/audit.sh

############# BEGIN INSTALL ####################
# install additional packages
RUN apk add \
  grep
  #openssl

# Delete unneeded users and groups from the base image
COPY deluser.sh /tmp/
RUN chmod 770 /tmp/deluser.sh
RUN sh /tmp/deluser.sh
RUN rm /tmp/deluser.sh

# Disable unnecessary applications from the base image
COPY delbin.sh /tmp/
RUN chmod 770 /tmp/delbin.sh
#RUN sh /tmp/delbin.sh
#RUN rm /tmp/delbin.sh

# Run post update system configuration audit
RUN sh /tmp/audit.sh

# Clean up apk cache
RUN rm -rf /var/cache/apk/*
############# END INSTALL ####################

CMD ["/bin/sh"]
#CMD ["/bin/ssh"]
