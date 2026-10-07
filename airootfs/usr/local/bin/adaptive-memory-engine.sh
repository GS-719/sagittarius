#!/bin/bash
TOTAL_RAM_GIB=$(free -g | awk '/^Mem:/{print $2}')
sysctl -w net.core.rmem_max=16777216

if [ "$TOTAL_RAM_GIB" -le 2 ]; then
    sysctl -w vm.swappiness=100 vm.vfs_cache_pressure=50 vm.dirty_ratio=10
    echo -e "[zram0]\nzram-size = ${TOTAL_RAM_GIB}000\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
elif [ "$TOTAL_RAM_GIB" -le 4 ]; then
    sysctl -w vm.swappiness=20 vm.vfs_cache_pressure=25 vm.dirty_ratio=30
    SAFE_ZRAM=$(echo "$TOTAL_RAM_GIB * 1.5" | bc)
    echo -e "[zram0]\nzram-size = ${SAFE_ZRAM}000\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
else
    sysctl -w vm.swappiness=0 vm.vfs_cache_pressure=10 vm.dirty_ratio=40
    echo -e "[zram0]\nzram-size = 4000\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf
fi
systemctl restart systemd-zram-setup@zram0.service
