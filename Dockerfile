FROM ccakes/perl-alpine:latest
MAINTAINER cam.daniel@gmail.com

ENV OREPAN_ROOT /darkpan
ENV SERVER_PORT 3000

ADD https://github.com/ccakes/mojo-orepan2/archive/master.zip /

RUN unzip /master.zip && cd mojo-orepan2-master && carton install
WORKDIR /mojo-orepan2-master

CMD carton exec -- morbo -l http://*:$SERVER_PORT mojo-orepan2