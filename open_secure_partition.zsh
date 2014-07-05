#!/usr/bin/zsh

sudo cryptsetup luksOpen /media/harry/3612e1c7-7940-47ca-a2fc-77f2c9aa92a8/partitions/partition1 LUKS
sudo mount /dev/mapper/LUKS /mnt/LUKS

