#!/bin/bash

rootTitle() {
  while true
  do
    xsetroot -name "$(date '+%a %b %d %H:%M:%S')"
    sleep 60
  done
}
rootTitle &

exec /usr/local/bin/dwm
