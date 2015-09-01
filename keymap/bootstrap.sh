#!/bin/sh

CONF_DIR="$(dirname $0)"
CONF_FILE="$CONF_DIR/conf.json"

. $CONF_DIR/bootstrap_func.sh

domains=$(cat $CONF_FILE | jq -r 'keys[]')

for domain in $domains; do
  menu_items=$(cat $CONF_FILE | jq -r ".\"$domain\" | keys[]")

  while read -r menu_item; do

    keys=$(map_keys $(cat $CONF_FILE | jq -r ".\"$domain\".\"$menu_item\""))


    # echo "$menu_item $keys"
    eval "defaults write $domain NSUserKeyEquivalents -dict-add \"$menu_item\" '\"$keys\"'"

  done <<< "$menu_items"
done
