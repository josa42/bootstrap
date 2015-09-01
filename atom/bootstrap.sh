#!/bin/sh

if [ "$(which apm)" != "" ]; then
  apm install --packages-file "$(dirname $0)/packages.txt"
fi
