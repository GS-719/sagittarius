#!/bin/bash

ROOT_PART=$(findmnt -n -o SOURCE /)
ROOT_PARTUUID=$(blkid -s PARTUUID -o value "$ROOT_PART")

mkdir -p /boot/loader/entries

cat << BOOT_EOF > /boot/loader/entries/arch-v1.conf
title   Arch Linux (v1-Generic Baseline)
linux   /vmlinuz-linux-v1-generic
initrd  /initramfs-linux-v1-generic.img
options root=PARTUUID=$ROOT_PARTUUID rw mitigations=off split_lock_detect=off clearcpuid=perf quiet loglevel=3
BOOT_EOF

echo "default arch-v1.conf" > /boot/loader/loader.conf
echo "timeout 3" >> /boot/loader/loader.conf
