FROM ubuntu:18.04

LABEL maintainer="contact@particule.io"

ENV PKGVER 2.9.1.1

RUN apt update && apt install -y \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -qO-  https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-$PKGVER-linux-amd64.tar.gz | tar xvzf - --strip-components 1 -C /usr/local

ENTRYPOINT ["pandoc", "-t", "revealjs", "-f", "markdown"]
