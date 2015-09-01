#!/bin/sh

sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DIR_BOOTSTRAP="$HOME/github/bootstrap"
REPO_BOOTSTRAP="git@github.com:josa42/bootstrap.git"

if [ ! -d "$DIR_BOOTSTRAP" ]; then
  git clone $REPO_BOOTSTRAP
fi

cd $DIR_BOOTSTRAP


./homebrew/bootstrap.sh
./dotfiles/bootstrap.sh
./atom/bootstrap.sh
