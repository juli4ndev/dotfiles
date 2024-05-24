#!/bin/bash

# . /etc/X11/Xsession

dbus-update-activation-environment --all
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,login,gpg)
# gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,login,gpg
export SSH_AUTH_SOCK
exec leftwm
