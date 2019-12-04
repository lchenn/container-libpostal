FROM python:3.7.5-slim-stretch

COPY build_libpostal.sh /tmp
RUN apt-get update && \
    apt-get install -y autoconf automake build-essential curl git libsnappy-dev libtool pkg-config && \
    apt-get clean && \
    git clone --depth=1 https://github.com/openvenues/libpostal && \
    cp /tmp/build_libpostal.sh /libpostal && \
    cd /libpostal && \
    ./build_libpostal.sh && \
    rm -rf /libpostal && \
    rm /tmp/build_libpostal.sh

RUN pip install --no-cache-dir postal

