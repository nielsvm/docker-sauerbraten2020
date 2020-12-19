FROM ubuntu:latest

ENV SB_SERVERPORT 28785
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
    bzip2 \
    wget \
    libc6 \
    libgcc-s1 \
    zlib1g \
    && apt-get clean

RUN wget -qO /sb.tar.bz2 "https://downloads.sourceforge.net/project/sauerbraten/sauerbraten/2020_11_29/sauerbraten_2020_12_04_linux.tar.bz2?ts=1467054652&use_mirror=deac-ams"

RUN  cd /usr/local/ \
     && tar xvjf /sb.tar.bz2 \
     && rm /sb.tar.bz2 \
     && rm -rf /sb/packages/* \
     && chown -R root:root /sb

VOLUME /root/.sauerbraten/

COPY docker-entrypoint.sh /sb/docker-entrypoint.sh

RUN cp /sb/server-init.cfg /sb/server-init.cfg.orig

EXPOSE $SB_SERVERPORT/udp $SB_SERVERPORT/tcp

ENTRYPOINT [ "/sb/docker-entrypoint.sh" ]
