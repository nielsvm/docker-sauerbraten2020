# docker-sauerbraten server (2020)

Disk-optimized [Sauerbraten](http://sauerbraten.org/) **game server** container shipping the recent 2020 edition. While the build process downloads the entire package 985.8 MB large package, the game assets are removed directly after package extraction keeping the image footprint small. The built image on Docker Hub is thus kept very small.

### Configuration

The container can be configured through environment variables:

```
SB_SERVERIP="1.2.3.4"
SB_SERVERPORT="28785"
SB_SERVERPASS="SecretPassw0rd
SB_SERVERDESC="Welcome to my server"
SB_SERVERMOTD="Server rules: 1) don't kill anyone"
SB_PUBLICSERVER=0
SB_UPDATEMASTER=0
```

See [`docker-entrypoint.sh`](docker-entrypoint.sh) and [`server-init.cfg`](https://sourceforge.net/p/sauerbraten/code/HEAD/tree/server-init.cfg) for all the variables and settings you can configure. Some variables aren't accessible though pull requests are welcome.