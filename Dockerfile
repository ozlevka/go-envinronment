FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y openssl sudo software-properties-common apt-transport-https wget curl \
    && apt-get install -y libx11-xcb1 libasound2 x11-apps libice6 libsm6 libxaw7 libxft2 libxmu6 libxpm4 libxt6 x11-apps xbitmaps \
    && useradd -m -p $(echo "developer" | openssl passwd -1 -stdin) -s /bin/bash developer \
    && usermod -aG sudo developer \
    && mkdir -p /home/developer/tmp && cd /home/developer/tmp \
    && curl -o code.deb -J -L https://go.microsoft.com/fwlink/?LinkID=760868 \
    && apt-get install -y ./code.deb \
    && cd .. && rm -rf tmp

USER developer