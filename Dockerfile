FROM jellyfin/jellyfin:latest

RUN apt-get update; apt-get install fonts-noto-cjk-extra -y
