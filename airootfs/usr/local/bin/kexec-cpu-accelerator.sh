#!/bin/bash
if grep -q "avx512f" /proc/cpuinfo; then
    kexec -l /boot/vmlinuz-linux-v4-ultra --initrd=/boot/initramfs-linux.img --reuse-cmdline
    systemctl kexec
elif grep -q "avx2" /proc/cpuinfo; then
    kexec -l /boot/vmlinuz-linux-v3-perf --initrd=/boot/initramfs-linux.img --reuse-cmdline
    systemctl kexec
fi
