#!/bin/sh

map_key () {

  case $1 in
  	"super") echo '@' ;;
  	"alt")   echo '~' ;;
  	"ctrl")  echo '^' ;;
  	"tab")   echo '\\U21e5' ;;
    'shift') echo  '$' ;;
    'enter') echo '\\U21a9' ;;
    *)       echo $1 ;;
  esac
}

map_keys () {
  keys=$1
  keys=${keys//+/ }

  for key in $keys; do
    keys=${keys//$key/$(map_key $key)}
  done

  echo ${keys// /}
}
