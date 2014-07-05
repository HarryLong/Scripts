#!/usr/bin/zsh

sudo umount /dev/mapper/LUKS
sudo cryptsetup luksClose LUKS
