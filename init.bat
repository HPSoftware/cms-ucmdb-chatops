set CLIENT_ID=<client_id>
set CLIENT_SECRET=<client_secret>
set BOT_NAME=<bot_name>

rem set HTTP_PROXY=<http_proxy>
rem set HTTPS_PROXY=<https_proxy>

if exist data RMDIR /s /q data
if exist start.bat del /f start.bat
if exist start.sh del /f start.sh

call npm install

coffee install-slackapp.coffee %CLIENT_ID% %CLIENT_SECRET% %BOT_NAME% %HTTP_PROXY% %HTTPS_PROXY%
