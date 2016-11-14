export CLIENT_ID=<client_id>
export CLIENT_SECRET=<client_secret>
export BOT_NAME=<bot_name>

# export http_proxy=<http_proxy>
# export https_proxy=<https_proxy>

rm -rf data
rm start.bat
rm start.sh

npm install

coffee install-slackapp.coffee $CLIENT_ID $CLIENT_SECRET $BOT_NAME $http_proxy $https_proxy
