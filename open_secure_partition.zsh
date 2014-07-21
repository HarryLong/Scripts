#!/usr/bin/zsh

sudo cryptsetup luksOpen /mnt/passport/ext2/partitions/partition1 LUKS
sudo mount /dev/mapper/LUKS /mnt/LUKS

