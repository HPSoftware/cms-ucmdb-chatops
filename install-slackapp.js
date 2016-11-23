/**
 * Created by covaciu on 11/10/2016.
 */
var fs = require('fs');

exports.createStartFiles = function (apiToken, botToken, httpProxy, httpsProxy) {
  //windows
  var batFileContent = [];
  var windowsHttpProxy = httpProxy != null && httpProxy != '' ? 'set HTTP_PROXY=' + httpProxy : '';
  var windowsHttpsProxy = httpsProxy != null && httpsProxy != '' ? 'set HTTPS_PROXY=' + httpsProxy : '';
  batFileContent.push(
    'set CONFIG_FILE=./config.json' + '\n',
    'set SLACK_APP_TOKEN=' + apiToken + '\n',
    'set HUBOT_SLACK_TOKEN=' + botToken + '\n',
    '\n',
    'set HUBOT_LOG_LEVEL=debug' + '\n',
    '\n',
    windowsHttpProxy + '\n',
    windowsHttpsProxy + '\n',
    '\n',
    'bin\\hubot.cmd --adapter slack' + '\n'
  );
  fs.writeFileSync('start.bat', batFileContent.join(''));

  //linux
  var shFileContent = [];
  var linuxHttpProxy = httpProxy != null && httpProxy != '' ? 'export http_proxy=' + httpProxy : '';
  var linuxHttpsProxy = httpsProxy != null && httpsProxy != '' ? 'export https_proxy=' + httpsProxy : '';
  shFileContent.push(
    'export CONFIG_FILE=./config.json' + '\n',
    'export SLACK_APP_TOKEN=' + apiToken + '\n',
    'export HUBOT_SLACK_TOKEN=' + botToken + '\n',
    '\n',
    'export HUBOT_LOG_LEVEL=debug' + '\n',
    '\n',
    linuxHttpProxy + '\n',
    linuxHttpsProxy + '\n',
    '\n',
    'sh bin/hubot --adapter slack' + '\n'
  );
  fs.writeFileSync('start.sh', shFileContent.join(''));

  console.dir('Files start.bat and start.sh were created.');
};
