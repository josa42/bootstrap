#!/bin/sh

CONF_DIR="$(dirname $0)"
CONF_FILE="$CONF_DIR/conf.json"

domains=$(cat $CONF_FILE | jq -r 'keys[]')

for domain in $domains; do

  values=$(cat $CONF_FILE | jq -r ".\"$domain\"[]")

  while read -r value; do
    echo "defaults write $domain $value"
    eval "defaults write $domain $value"
  done <<< "$values"
done

killall Dock
killall Finder
