#! /bin/bash
# taken from https://mikeshade.com/posts/keychron-linux-function-keys/
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
# a sudo mkinitcpio -P may be required afterwards
