#!/bin/bash
RAM_GB=$(( $(grep MemTotal /proc/meminfo | awk '{print $2}') / 1024 / 1024 ))

if [ "$RAM_GB" -le 2 ]; then
    sysctl -w vm.swappiness=100 vm.vfs_cache_pressure=50 vm.dirty_ratio=10
    echo -e "[zram0]\nzram-size = ram\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
elif [ "$RAM_GB" -le 4 ]; then
    sysctl -w vm.swappiness=20 vm.vfs_cache_pressure=25 vm.dirty_ratio=30
    echo -e "[zram0]\nzram-size = ram * 1.5\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
else
    sysctl -w vm.swappiness=0 vm.vfs_cache_pressure=10 vm.dirty_ratio=40
    echo -e "[zram0]\nzram-size = 4096\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
fi
systemctl restart systemd-zram-setup@zram0.service
