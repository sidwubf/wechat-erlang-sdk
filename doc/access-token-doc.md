# Access Token

## Get Access Token

### example:
    curl -X GET "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"
    
### parameter:

Parameter    | Description
------------ | -------------
grant_type   | "client_credential"
appid        | id
secret       | app secret

### return:
	{"access_token":"ACCESS_TOKEN","expires_in":7200}
	
Parameter    | Description
------------ | -------------
access_token | access token, 512
expires_in   | expire time, seconds
