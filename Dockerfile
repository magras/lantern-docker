FROM docker.io/ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends libayatana-appindicator3-1 libpcap0.8

COPY binaries/lantern-installer-64-bit.deb /root
RUN dpkg -i /root/lantern-installer-64-bit.deb

RUN groupadd -g 1000 lantern && \
    useradd -m -s /usr/sbin/nologin -u 1000 -g 1000 lantern

COPY --chown=lantern:lantern settings.yaml /home/lantern/.lantern/

USER lantern
CMD ["lantern", "-headless", "-no-ui-http-token"]
