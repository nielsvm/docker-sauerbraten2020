# docker-sauerbraten server (2020)

Disk-optimized [Sauerbraten](http://sauerbraten.org/) **game server** container shipping the recent 2020 edition. While the build process downloads the entire package 985.8 MB large package, the game assets are removed directly after package extraction keeping the image footprint small. The built image on Docker Hub is thus only ~60Mb and kept very small.

### Configuration

The container can be configured through environment variables:

```
SB_SERVERPASS="SecretPassw0rd
SB_SERVERDESC="My docker-sauerbraten server"
SB_SERVERMOTD="Rules: 1) don't shoot 2) don't kill 3) say hi"
SB_PUBLICSERVER=0
SB_UPDATEMASTER=0
```

See [`docker-entrypoint.sh`](docker-entrypoint.sh) and [`server-init.cfg`](https://sourceforge.net/p/sauerbraten/code/HEAD/tree/server-init.cfg) for all the variables and settings you can configure. Some variables aren't accessible though pull requests are welcome.

**Note:** The default port is `28785`, use a portmap to change it.

### Docker

The image for this `Dockerfile` is hosted [hub.docker.com](https://hub.docker.com/r/nielsvm/sauerbraten2020) and can be pulled as follows:

```
docker pull nielsvm/sauerbraten2020
```

### Caprover

This repository works as-is on top of your [Caprover](https://caprover.com/)
instance, just clone this repository and run:

```
caprover deploy
```

Please note that the image building takes a while!
