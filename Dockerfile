FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# package installs
RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    cmake \
    mesa-common-dev \
    libglu1-mesa-dev freeglut3-dev \
    libglfw3-dev libgles2-mesa-dev \
    libgl-dev \
    libgtest-dev \
    libboost-test-dev \ 
    libavcodec-dev \
    libavformat-dev \
    libavdevice-dev \
    libavfilter-dev \
    ffmpeg \
    bison \
    gawk \
    git \
    nano \
    ca-certificates && \
    update-ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/dev
WORKDIR /root/dev
RUN git clone https://github.com/cxrodgers/whisk.git
WORKDIR /root/dev/whisk/

# Run cmake configure & build process
RUN mkdir build
WORKDIR /root/dev/whisk/build
RUN cmake ..
RUN make

ENV PATH="$PATH:/root/dev/whisk/build"

RUN cp ~/dev/whisk/build/libwhisk.so ~/dev/whisk/python

WORKDIR /data