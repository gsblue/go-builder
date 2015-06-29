FROM golang:1.4.2
MAINTAINER Gurnam Madan <gs.madan@gmail.com>

RUN go get golang.org/x/tools/cmd/cover

VOLUME /src
WORKDIR /src

COPY build_environment.sh /
COPY build.sh /

ENTRYPOINT ["/build.sh"]