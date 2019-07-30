FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y openssl sudo \
    && useradd -m -p $(echo "developer" | openssl passwd -1 -stdin) -s /bin/bash developer \
    && usermod -aG sudo developer

USER developer