FROM docker.io/ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends libayatana-appindicator3-1 libpcap0.8

COPY binaries/lantern-installer-64-bit.deb /root
RUN dpkg -i /root/lantern-installer-64-bit.deb

ARG UID=1000
ARG GID=1000

RUN groupadd -g "$GID" lantern && \
    useradd -m -s /usr/sbin/nologin -u "$UID" -g "$GID" lantern

COPY --chown=lantern:lantern settings.yaml /home/lantern/.lantern/

USER lantern
CMD ["lantern", "-headless", "-no-ui-http-token"]
