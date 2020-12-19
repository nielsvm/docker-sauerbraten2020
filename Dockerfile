FROM ubuntu:latest

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
# COPY sauerbraten.tar.bz2 /usr/local/sauerbraten.tar.bz2

RUN  cd /usr/local/ \
     && tar xvjf /usr/local/sauerbraten.tar.bz2 \
     && rm /usr/local/sauerbraten.tar.bz2 \
     && rm -rf /usr/local/sauerbraten/packages/* \
     && chown -R root:root /usr/local/sauerbraten

# apt install dumb-init
# RUN wget -qO /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 \
# && chmod +x /usr/local/bin/dumb-init

VOLUME /root/.sauerbraten/

RUN ls -lA /usr/local/sauerbraten
RUN ls -lA /root/.sauerbraten/

WORKDIR /usr/local/sauerbraten

EXPOSE 28785/udp 28785/tcp

CMD [ "/usr/local/sauerbraten/bin_unix/linux_server", "-d" ]
