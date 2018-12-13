#!/bin/bash

if [ -z "$UID" ] || [ -z "$GID" ]; then
  echo "no UID and/or GID set (both must be set)"
else
  echo "using UID:$UID and GID:$GID"
  usermod -u $UID minecraft
  groupmod -o -g $GID minecraft
fi

download_url = ""
if [ -z "$URL" ]; then
  if ! [ -z "$VERSION" ]; then
    download_url = "https://minecraft.azureedge.net/bin-linux/bedrock-server-$VERSION.zip"
    echo "Set download URL from version: $download_url"
  fi
else
  download_url = "$URL"
  echo "Set download URL: $download_url"
fi

if ! [ -z "$download_url" ]; then
  if [ $(< /bedrock-server/current_version.txt) != "$download_url" ]; then
    echo "Upgrading server..."
    curl "$download_url" --output new-bedrock-server.zip
    unzip new-bedrock-server.zip -d new-bedrock-server
    rm -rf /new-bedrock-server/worlds /new-bedrock-server/permissions.json /new-bedrock-server/whitelist.json /new-bedrock-server/server.properties
    cp -R /new-bedrock-server/. /bedrock-server/
    rm -rf /new-bedrock-server new-bedrock-server.zip
    echo "$download_url" > /bedrock-server/current_version.txt
    echo "done."
  else
    echo "Requested version is the same as installed version, doing nothing."
  fi
fi
    

exec /usr/sbin/gosu minecraft "$@"
