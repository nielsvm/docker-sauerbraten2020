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

RUN wget -qO /usr/local/sauerbraten.tar.bz2 "https://downloads.sourceforge.net/project/sauerbraten/sauerbraten/2020_11_29/sauerbraten_2020_12_04_linux.tar.bz2?ts=1467054652&use_mirror=deac-ams"

RUN  cd /usr/local/ \
     && tar xvjf /usr/local/sauerbraten.tar.bz2 \
     && rm /usr/local/sauerbraten.tar.bz2 \
     && rm -rf /usr/local/sauerbraten/packages/* \
     && chown -R root:root /usr/local/sauerbraten

VOLUME /root/.sauerbraten/

WORKDIR /usr/local/sauerbraten

RUN cp server-init.cfg server-init.cfg.orig

EXPOSE $SB_SERVERPORT/udp $SB_SERVERPORT/tcp

CMD [ "docker-entrypoint.sh" ]
