FROM alpine:latest

# Labels
LABEL Description "Our goal is to create a simple, consistent, customizable and convenient image using official image" \
	  maintainer "https://github.com/alejo194/ftp/edit/master/Dockerfile"

# Environment variables
ENV FTPS_SOURCE_DIR=/sources/ftps \
	FTPS_USER_HOME=/home/vsftpd/data

# install apps... (shadow for usermod/groupmode)
RUN apk update && apk upgrade; \
	apk add --no-cache \
	shadow \
	bash \
	tzdata \
	vsftpd \
	curl \
	openssl

# creating self signed certificate
RUN mkdir -p /usr/certs; \
	openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -subj "/C=US/ST=Docker/L=Docker/O=httpd/CN=*" -keyout /usr/certs/cert.key -out /usr/certs/cert.crt; \
	chmod 644 /usr/certs/cert.key; \
	chmod 644 /usr/certs/cert.crt; \
	apk del openssl

ADD sources/ $FTPS_SOURCE_DIR/

# set permission
RUN chmod 770 $FTPS_SOURCE_DIR/*.sh; \
	chmod 770 $FTPS_SOURCE_DIR/eventscripts/*.sh; \
	mkdir -p $FTPS_USER_HOME/data

ENTRYPOINT $FTPS_SOURCE_DIR/entrypoint.sh
