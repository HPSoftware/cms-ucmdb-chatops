# cms-ucmdb-chatops

## Configuration

1. Enter the required information in the `install.bat`(windows)/`install.sh`(linux) file:
      ```bash
      set CLIENT_ID=<client_id>
      set CLIENT_SECRET=<client_secret>
      set BOT_NAME=<bot_name>
      
      set HTTP_PROXY=<http_proxy>
      set HTTPS_PROXY=<https_proxy>
      ```
2. Configure the ucmdb server in the `config.json` file:
    ```bash
        "config":{
            "ucmdb":{
              "servers":{
                "default":"server_one",
                "server_one":{
                  "protocol":"<http/https>",
                  "endpoint":"<ucmdb_server_url>",
                  "port":"<port_number>",
                  "account":"<username>",
                  "password":"<encrypted_password>"
                }
              }
            }
        }
    ```

3. Run `install.bat`/`install.sh`

    Note: If doing this for the first time, it may take a while because also an `npm install` is executed.

4. Go to [http://localhost:4000](http://localhost:4000) and add your bot to Slack
5. Run `start.bat`/`start.sh`
