#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    id_like=$(awk -F= '$1 == "ID_LIKE" {print $2}' /etc/os-release)
    if [[ "$distro" == "arch" || "$id_like" == "arch" ]]; then
       echo "Arch Linux Detected"
       sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc xz python-pip brotli lz4 gawk libmpack aria2
       #aur=rar
    else
       sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python-pip brotli liblz4-tool gawk aria2
    fi
    sudo apt update && sudo apt install -y python3-pip python3-dev liblzma-dev
    pip3 install backports.lzma protobuf pycryptodome
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2
    pip3 install backports.lzma protobuf pycryptodome
fi
