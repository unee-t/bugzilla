FROM ubuntu
MAINTAINER Kai Hendry <kai.hendry@unee-t.com>

# BEGIN STUFF THAT SHOULD BE IN A BASE IMAGE
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl apache2 make gcc g++ \
    libxml2-dev libgd-dev vim-tiny libdbd-mysql-perl \
    libapache2-mod-perl2 libmariadb-client-lgpl-dev msmtp msmtp-mta gettext-base tzdata

RUN apt-get install -y cpanminus
RUN cpanm --notest App::cpm Module::CPANfile

RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime

RUN a2enmod headers expires
RUN a2dissite 000-default

# END STUFF FOR BASE IMAGE

ENV BUGZILLA bugzilla-5.0.4
ENV BUGZILLA_TAR $BUGZILLA.tar.gz
ENV BUGZILLA_URL http://ftp.mozilla.org/pub/mozilla.org/webtools/$BUGZILLA_TAR
RUN curl --silent --output "/tmp/$BUGZILLA_TAR" "$BUGZILLA_URL"
RUN tar xzvf "/tmp/$BUGZILLA_TAR" --directory /opt/
RUN cd /opt/ && ln -s "$BUGZILLA" bugzilla
WORKDIR /opt/bugzilla
COPY gen-cpanfile.pl /usr/local/bin/gen-cpanfile.pl
RUN perl Build.PL && \
    perl /usr/local/bin/gen-cpanfile.pl && \
    cpm install -g --with-recommends --without-test

# MyISAM to InnoDB https://github.com/bugzilla/bugzilla/pull/62
COPY 62.diff .
RUN patch -p1 < 62.diff

# Set up apache link to bugzilla
ADD bugzilla.conf /etc/apache2/sites-available/
RUN a2dismod mpm_event
RUN a2enmod rewrite headers expires cgi mpm_prefork
RUN a2ensite bugzilla

# email sending configuration
COPY msmtprc /etc/msmtprc.temp
