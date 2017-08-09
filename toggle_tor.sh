#!/bin/bash

function return_tor_pid() {
  sudo netstat -pln | \
    grep 9050 | \
    grep tor | \
    awk '{print $7}' | \
    sed 's/\// /g' | \
    awk '{print $1}'
}

pid=$(return_tor_pid)
if [[ $pid != "" ]]; then
  echo "Killing Old PID: ${pid}"
  kill -9 $pid
fi

/usr/bin/tor &
