FROM debian:jessie

# mirror server
RUN echo "deb http://ftp.jp.debian.org/debian jessie main" > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install --no-install-recommends -y apt-cacher-ng && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

VOLUME ["/var/cache/apt-cacher-ng"]

EXPOSE 3142

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
