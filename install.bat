set CLIENT_ID=95277992615.95280194577
set CLIENT_SECRET=4d7a3b65de0eb29a6d835206da52b770
set BOT_NAME=ucmdbot

set HTTP_PROXY=http://web-proxy.eu.hpecorp.net:8080
set HTTPS_PROXY=http://web-proxy.eu.hpecorp.net:8080





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
