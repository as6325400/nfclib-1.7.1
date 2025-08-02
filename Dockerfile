FROM arm32v7/debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://archive.debian.org/debian/pool/main/libu/libusb-compat/libusb-compat-0.1-dev_0.1.5-3_armhf.deb && \
    dpkg -i libusb-compat-0.1-dev_0.1.5-3_armhf.deb || apt-get install -f -y

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    build-essential \
    autoconf \
    automake \
    libtool \
    pkg-config \
    libusb-1.0-0-dev \
    libglib2.0-dev \
    libudev-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/nfc-tools/libnfc.git /usr/src/libnfc

WORKDIR /usr/src/libnfc

RUN git checkout libnfc-1.7.1

RUN autoreconf -vis

RUN ./configure --prefix=/usr --sysconfdir=/etc --with-drivers=pn532_uart,pn532_spi,pn532_i2c && \
    make && \
    make install && \
    ldconfig


CMD ["nfc-list"]
