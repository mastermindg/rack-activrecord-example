FROM ruby:2.3.3-alpine
MAINTAINER Ken Jenney

ENV hub="mesos.hub.service.thisdirectory"

# Install requirements for activerecord and pg
RUN echo 'http://alpine.gliderlabs.com/alpine/edge/testing' >> /etc/apk/repositories && \
    	echo 'http://alpine.gliderlabs.com/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --update build-base \
        libc-dev \
        bash \
        gcc \
        libxml2 \
        libxml2-dev \
        libxslt \
        libxslt-dev \
        gmp-dev \
        libc-dev \
        postgresql-dev \
	openssl-dev \
        vim \
   	libc6-compat \
        && rm -rf /var/cache/apk/*

COPY app /usr/src/app
WORKDIR /usr/src/app
RUN gem install bundler
RUN bundle install
COPY start.sh /
RUN chmod +x /start.sh
CMD /start.sh
