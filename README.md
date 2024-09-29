# jellyfin-with-fonts
a tailscale docker image with derp server. It will auto get newest tailscale version, and build docker image in 00:00 every day.

https://hub.docker.com/r/wondersoap/jellyfin-with-fonts

```Dockerfile
FROM jellyfin/jellyfin:latest

RUN apt-get update; apt-get install fonts-noto-cjk-extra -y
```


