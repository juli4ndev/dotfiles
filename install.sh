#!/bin/bash

sudo apt-get install xserver-xorg-core xserver-xorg-video-intel xserver-xorg-input-libinput x11-xserver-utils x11-xkb-utils xinit build-essential ca-certificates curl dbus-x11 dbus-user-session libpam-systemd libgtk-3-dev autoconf make texinfo libgccjit-12-dev libgnutls28-dev libgif-dev libpng-dev libjpeg-dev libxpm-dev libtree-sitter-dev libtinfo-dev xaw3dg-dev librsvg2-dev libsqlite3-dev liblcms2-dev libgpm-dev libgconf2-dev libxml2-dev libsystemd-dev libm17n-dev libotf-dev stow pipewire-audio libavcodec-extra picom feh fonts-noto fonts-noto-mono fonts-noto-cjk fonts-noto-cjk-extra fonts-noto-color-emoji fonts-noto-extra

curl https://sh.rustup.rs -sSf | sh -s -- -y

source ~/.bashrc

mkdir ~/Projects/leftwm
mkdir ~/Projects/gnu

cd ~/Projects/leftwm
git clone https://github.com/leftwm/leftwm.git
cd leftwm
cargo build --profile optimized
sudo install -s -Dm755 ./target/optimized/leftwm ./target/optimized/leftwm-worker ./target/optimized/lefthk-worker ./target/optimized/leftwm-state ./target/optimized/leftwm-check ./target/optimized/leftwm-command -t /usr/bin

cd ~/Projects/gnu
git clone -b master git://git.sv.gnu.org/emacs.git
cd emacs
./autogen.sh
./configure --with-tree-sitter --with-native-compilation --with-x-toolkit=lucid --with-gconf --with-mailutils
sudo make -j$(nproc)
sudo make install -j$(nproc)

systemctl --user --now enable emacs.service
systemctl --user --now enable wireplumber.service

rm ~/.xinitrc ~/.profile ~/.config/leftwm ~/.config/rofi

cd ~/Projects/juli4ndev/dotfiles

stow -t "$HOME" -R leftwm rofi systemd xorg fontconnfig eww picom
