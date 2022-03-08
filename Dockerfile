FROM docker.io/ubuntu:20.04

ARG URL=https://getlantern.org/lantern-installer-64-bit.deb

RUN apt-get update && apt-get install -y \
        libappindicator3-1 \
        libpcap0.8 \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && cd /root \
    && wget "$URL" \
    && dpkg -i lantern-installer-64-bit.deb \
    && groupadd -g 1000 lantern \
    && useradd -m -s /usr/sbin/nologin -u 1000 -g 1000 lantern

COPY --chown=lantern:lantern settings.yaml /home/lantern/.lantern/

USER lantern
CMD ["lantern", "-headless", "-no-ui-http-token"]
