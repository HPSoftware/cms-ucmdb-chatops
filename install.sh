#!/usr/bin/env bash
export CLIENT_ID=<client_id>
export CLIENT_SECRET=<client_secret>
export BOT_NAME=<bot_name>

export http_proxy=<http_proxy>
export https_proxy=<https_proxy>





if [ -n "$http_proxy" ];
then
  git config --global http.proxy $http_proxy
  npm config set proxy $http_proxy
fi
if [ -n "$https_proxy" ];
then
  git config --global https.proxy $https_proxy
  npm config set https-proxy $https_proxy
fi

rm -rf data
rm start.bat
rm start.sh

npm install
npm install coffee-script -g

coffee install-slackapp.coffee $CLIENT_ID $CLIENT_SECRET $BOT_NAME $http_proxy $https_proxy
