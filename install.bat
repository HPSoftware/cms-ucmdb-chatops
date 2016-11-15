set CLIENT_ID=<client_id>
set CLIENT_SECRET=<client_secret>
set BOT_NAME=<bot_name>

rem set HTTP_PROXY=<http_proxy>
rem set HTTPS_PROXY=<https_proxy>





if not "%HTTP_PROXY%"=="" (
  call git config --global http.proxy %HTTP_PROXY%
  call npm config set proxy %HTTP_PROXY%
)
if not "%HTTPS_PROXY%"=="" (
  call git config --global https.proxy %HTTPS_PROXY%
  call npm config set https-proxy %HTTPS_PROXY%
)

if exist data (
  RMDIR /s /q data
)
if exist start.bat (
  del /f start.bat
)
if exist start.sh (
  del /f start.sh
)

call npm install
call npm install coffee-script -g

coffee install-slackapp.coffee %CLIENT_ID% %CLIENT_SECRET% %BOT_NAME% %HTTP_PROXY% %HTTPS_PROXY%
