#!/bin/bash

if [ -z "$UID" ] || [ -z "$GID" ]; then
  echo "no UID and/or GID set"
else
  echo "using UID:$UID and GID:$GID"
  usermod -u $UID minecraft
  groupmod -o -g $GID minecraft
fi

exec /usr/local/bin/gosu minecraft "$@"
