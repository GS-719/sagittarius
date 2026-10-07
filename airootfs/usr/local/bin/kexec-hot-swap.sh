#!/bin/bash
if grep -q "avx512f" /proc/cpuinfo; then
    if [ -f "/boot/vmlinuz-linux-v4-ultra" ]; then
        kexec -l /boot/vmlinuz-linux-v4-ultra --initrd=/boot/initramfs-linux-v1-generic.img --reuse-cmdline
        systemctl kexec
    fi
elif grep -q "avx2" /proc/cpuinfo; then
    if [ -f "/boot/vmlinuz-linux-v3-perf" ]; then
        kexec -l /boot/vmlinuz-linux-v3-perf --initrd=/boot/initramfs-linux-v1-generic.img --reuse-cmdline
        systemctl kexec
    fi
fi
