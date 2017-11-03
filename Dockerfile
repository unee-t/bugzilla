FROM ubuntu
MAINTAINER Kai Hendry <kai.hendry@unee-t.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl apache2 make gcc g++ \
	libxml2-dev libgd-dev vim-tiny libdbd-mysql-perl \
	libapache2-mod-perl2 libmariadb-client-lgpl-dev msmtp msmtp-mta gettext-base

RUN a2enmod headers expires
RUN a2dissite 000-default

ENV BUGZILLA bugzilla-5.0.3
ENV BUGZILLA_TAR $BUGZILLA.tar.gz
ENV BUGZILLA_URL http://ftp.mozilla.org/pub/mozilla.org/webtools/$BUGZILLA_TAR
RUN curl --silent --output "/tmp/$BUGZILLA_TAR" "$BUGZILLA_URL"
RUN tar xzvf "/tmp/$BUGZILLA_TAR" --directory /opt/
RUN cd /opt/ && ln -s "$BUGZILLA" bugzilla
WORKDIR /opt/bugzilla
RUN ./install-module.pl --all

# Set up apache link to bugzilla
ADD bugzilla.conf /etc/apache2/sites-available/
RUN a2enmod rewrite headers expires cgi
RUN a2ensite bugzilla

# email sending configuration
COPY msmtprc /etc/msmtprc.temp
