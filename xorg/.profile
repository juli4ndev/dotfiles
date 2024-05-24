# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -f "$HOME/.bashrc" ]; then
	  . "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes cargo's bin if it exists
# if [ -d "$HOME/.cargo/bin" ] ; then
#     PATH="$HOME/.cargo/bin:$PATH"
# fi

# set PATH so it includes volta's bin if it exists
# if [ -d "$HOME/.volta/bin" ] ; then
#     export VOLTA_HOME="$HOME/.volta"
#     PATH="$VOLTA_HOME/bin:$PATH"
# fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# if tty is 1, xinit is executed
[ -z "$DISPLAY" -a "$(tty)" = '/dev/tty1' ] && exec xinit -- vt01
