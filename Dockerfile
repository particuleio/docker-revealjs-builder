FROM ubuntu:18.04

LABEL maintainer="romain@particule.io"

ENV PKGVER 1.19.2.4~dfsg-1build4

RUN apt update && apt install -y \
    pandoc="$PKGVER" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["pandoc", "-t", "revealjs", "-f", "markdown"]
