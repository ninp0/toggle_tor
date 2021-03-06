#!/bin/bash

pid=$(ps -ef | grep '/usr/bin/tor' | grep -v grep | awk '{print $2}')
if [[ $pid != "" ]]; then
  echo "Killing Old PID: ${pid}"
  kill -9 $pid
  if (( $? != 0 )); then
    sudo kill -9 $pid
  fi
  sleep 3
fi

/usr/bin/tor &
