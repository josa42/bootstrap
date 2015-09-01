#!/bin/sh

DIR_LISTS="$(dirname $0)/lists"

if [ "$(which brew)" = "" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

cat $DIR_LISTS/brew-taps.txt | xargs brew tap --quiet
cat $DIR_LISTS/brew-list.txt | xargs brew install --quiet
cat $DIR_LISTS/brew-casks.txt | xargs brew cask install

brew cleanup
brew cask cleanup
