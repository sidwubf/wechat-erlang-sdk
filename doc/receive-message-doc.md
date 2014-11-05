#Receive message

##Verify the authenticity of the message
###parameter:
Parameter  | Description
---------- | -----------
signature  | wechat Encrypted signature
timestamp  | timestamp
nonce      | random number
echostr    | random string
###example(php):
	private function checkSignature() {
      $signature = $_GET["signature"];
      $timestamp = $_GET["timestamp"];
      $nonce = $_GET["nonce"];
      $token = TOKEN;
      $tmpArr = array($token, $timestamp, $nonce);
      sort($tmpArr, SORT_STRING);
      $tmpStr = implode( $tmpArr );
      $tmpStr = sha1( $tmpStr );
      if( $tmpStr == $signature ){
             return true;
      }else{
             return false;
      }
    }
##Receive common messages
###1.text messages
####example:
	<xml>
 		<ToUserName><![CDATA[toUser]]></ToUserName>
 		<FromUserName><![CDATA[fromUser]]></FromUserName> 
 		<CreateTime>1348831860</CreateTime>
 		<MsgType><![CDATA[text]]></MsgType>
 		<Content><![CDATA[this is a test]]></Content>
 		<MsgId>1234567890123456</MsgId>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | text
Content      | the message's content
MsgId        | message id, 64-bit integer
###2.picture messages
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
 		<FromUserName><![CDATA[fromUser]]></FromUserName>
 		<CreateTime>1348831860</CreateTime>
 		<MsgType><![CDATA[image]]></MsgType>
 		<PicUrl><![CDATA[this is a url]]></PicUrl>
 		<MediaId><![CDATA[media_id]]></MediaId>
 		<MsgId>1234567890123456</MsgId>
 	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | image
PicUrl       | the picture's link
MediaId      | the picture message's media id, you can use the media API to download data
MsgId        | message id, 64-bit integer
###3.voice messages:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>1357290913</CreateTime>
		<MsgType><![CDATA[voice]]></MsgType>
		<MediaId><![CDATA[media_id]]></MediaId>
		<Format><![CDATA[Format]]></Format>
		<MsgId>1234567890123456</MsgId>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | voice
MediaId      | the voice message's media id, you can use the media API to download data
Format       | amr, speex...
MsgId        | message id, 64-bit integer
###4.video messages:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>1357290913</CreateTime>
		<MsgType><![CDATA[video]]></MsgType>
		<MediaId><![CDATA[media_id]]></MediaId>
		<ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
		<MsgId>1234567890123456</MsgId>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | video
MediaId      | the video message's media id, you can use the media API to download data
ThumbMediaId | the video message's thumbnail id, you can use the media API to download data
MsgId        | message id, 64-bit integer
###5.location messages:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>1351776360</CreateTime>
		<MsgType><![CDATA[location]]></MsgType>
		<Location_X>23.134521</Location_X>
		<Location_Y>113.358803</Location_Y>
		<Scale>20</Scale>
		<Label><![CDATA[位置信息]]></Label>
		<MsgId>1234567890123456</MsgId>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | location
Location_X   | geographical dimension
Location_Y   | geographical longitude
Scale        | map zoom size
Label        | geographic information
MsgId        | message id, 64-bit integer
###6.link messages:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>1351776360</CreateTime>
		<MsgType><![CDATA[link]]></MsgType>
		<Title><![CDATA[公众平台官网链接]]></Title>
		<Description><![CDATA[公众平台官网链接]]></Description>
		<Url><![CDATA[url]]></Url>
		<MsgId>1234567890123456</MsgId>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | link
Title        | the message's title
Description  | the message's description
Url          | tht message's link
MsgId        | message id, 64-bit integer
##Receive event push
###1.subscribe/unsubscribe event:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[subscribe]]></Event>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | subscribe or unsubscribe
###2.scan QR code with parameters:
####example(unsubscribe):
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[subscribe]]></Event>
		<EventKey><![CDATA[qrscene_123123]]></EventKey>
		<Ticket><![CDATA[TICKET]]></Ticket>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | subscribe
EventKey     | key value, qrscene_ is prefix, 123123 is QR code's parameter
Ticket       | the QR code's ticket is used to get its picture
####example(subscribe):
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[SCAN]]></Event>
		<EventKey><![CDATA[qrscene_123123]]></EventKey>
		<Ticket><![CDATA[TICKET]]></Ticket>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | SCAN
EventKey     | key value, qrscene_ is prefix, 123123 is QR code's parameter
Ticket       | the QR code's ticket is used to get its picture
###3.report location:
####example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[LOCATION]]></Event>
		<Latitude>23.137466</Latitude>
		<Longitude>113.352425</Longitude>
		<Precision>119.385040</Precision>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | LOCATION
Latitude     | latitude
Longitude    | longitude
Precision    | location accuracy
###4.custom menu:
####example(click):
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[CLICK]]></Event>
		<EventKey><![CDATA[EVENTKEY]]></EventKey>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | CLICK
EventKey     | custom menu's key value
####example(view):
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[VIEW]]></Event>
		<EventKey><![CDATA[www.qq.com]]></EventKey>
	</xml>
####parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | event
Event        | VIEW
EventKey     | redirect url
##Receive voice recognition results
Turn on speech recognition, you will receive data by XML
###example:
	<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>1357290913</CreateTime>
		<MsgType><![CDATA[voice]]></MsgType>
		<MediaId><![CDATA[media_id]]></MediaId>
		<Format><![CDATA[Format]]></Format>
		<Recognition><![CDATA[腾讯微信团队]]></Recognition>
		<MsgId>1234567890123456</MsgId>
	</xml>
###parameter:
Parameter    | Description
------------ | -----------
ToUserName   | developer's wechat account
FromUserName | sender(a OpenID)
CreateTime   | the message's create time
MsgType      | voice
MediaId      | the voice message's media id, you can use the media API to download data
Fromat       | amr
Recognition  | the result of speech recognition(utf8)
MsgId        | message id, 64-bit integer