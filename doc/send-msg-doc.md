# Send Message API

## 1.send text message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"text","text":{"content":"Hello World"}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "text"
content      | message data

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[text]]></MsgType>
    <Content><![CDATA[你好]]></Content>
    </xml>
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | "text"
Content      | message content

## 2.send image message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"image","image":{"media_id":"MEDIA_ID"}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "image"
media_id     | image id

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[image]]></MsgType>
    <Image>
    <MediaId><![CDATA[media_id]]></MediaId>
    </Image>
    </xml>
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | image
MediaId      | unique id

## 3.send voice message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"voice","voice":{"media_id":"MEDIA_ID"}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "voice"
media_id     | voice id

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[voice]]></MsgType>
    <Voice>
    <MediaId><![CDATA[media_id]]></MediaId>
    </Voice>
    </xml>
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | voice
MediaId      | unique id

## 4.send video message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"video","video":{"media_id":"MEDIA_ID","thumb_media_id":"MEDIA_ID","title":"TITLE","description":"DESCRIPTION"}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "video"
media_id     | video id
thumb_media_id | thumb id
[title]      | video title
[description]| video description

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[video]]></MsgType>
    <Video>
    <MediaId><![CDATA[media_id]]></MediaId>
    <Title><![CDATA[title]]></Title>
    <Description><![CDATA[description]]></Description>
    </Video> 
    </xml>
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | video
MediaId      | unique id
[Title]      | video title
[Description]| video description

## 5.send music message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"music","music":{"title":"MUSIC_TITLE","description":"MUSIC_DESCRIPTION","musicurl":"MUSIC_URL","hqmusicurl":"HQ_MUSIC_URL","thumb_media_id":"THUMB_MEDIA_ID"}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "music"
[title]      | music title
[description]| music description
musicurl     | music url
hqmusicurl   | high quality music url
thumb_media_id | thumb id

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[music]]></MsgType>
    <Music>
    <Title><![CDATA[TITLE]]></Title>
    <Description><![CDATA[DESCRIPTION]]></Description>
    <MusicUrl><![CDATA[MUSIC_Url]]></MusicUrl>
    <HQMusicUrl><![CDATA[HQ_MUSIC_Url]]></HQMusicUrl>
    <ThumbMediaId><![CDATA[media_id]]></ThumbMediaId>
    </Music>
    </xml>
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | music
MediaId      | unique id
[Title]      | music title
[Description]| music description
[MusicURL]   | music url
[HQMusicUrl] | high quality music url
ThumbMediaId | thumb media id

## 6.send news message

### example:
    curl -X POST -d "{"touser":"OPENID","msgtype":"news","news":{"articles": [{"title":"Happy Day","description":"Is Really A Happy Day","url":"URL","picurl":"PIC_URL"},{"title":"Happy Day","description":"Is Really A Happy Day","url":"URL","picurl":"PIC_URL"}]}}" "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN"
    
### parameter:

Parameter    | Description
------------ | -------------
access_token | request certificate
touser       | user account
msgtype      | "news"
[title]      | title
[description]| description
[url]        | url
[picurl]     | pic url, JPG|PNG, big 640＊320, small 80＊80

### return:
    <xml>
    <ToUserName><![CDATA[toUser]]></ToUserName>
    <FromUserName><![CDATA[fromUser]]></FromUserName>
    <CreateTime>12345678</CreateTime>
    <MsgType><![CDATA[news]]></MsgType>
    <ArticleCount>2</ArticleCount>
    <Articles>
    <item>
    <Title><![CDATA[title1]]></Title> 
    <Description><![CDATA[description1]]></Description>
    <PicUrl><![CDATA[picurl]]></PicUrl>
    <Url><![CDATA[url]]></Url>
    </item>
    <item>
    <Title><![CDATA[title]]></Title>
    <Description><![CDATA[description]]></Description>
    <PicUrl><![CDATA[picurl]]></PicUrl>
    <Url><![CDATA[url]]></Url>
    </item>
    </Articles>
    </xml> 
    
Parameter    | Description
------------ | -------------
ToUserName   | receiver account
FromUserName | developer account
CreateTime   | send message time(Int)
MsgType      | news
ArticleCount | news count, <= 10
[Title]      | news title
[Description]| news description
[PicUrl]     | pic url, JPG|PNG, big 360＊200, small 200＊200
[Url]        | news url

## 7.Advanced send API

### 7.1 upload news

#### example:
    curl -X POST -d "{"articles": [{"thumb_media_id":"qI6_Ze_6PtV7svjolgs-rN6stStuHIjs9_DidOHaj0Q-mwvBelOXCFZiq2OsIU-p","author":"xxx","title":"Happy Day","content_source_url":"www.qq.com","content":"content","digest":"digest","show_cover_pic":"1"},{"thumb_media_id":"qI6_Ze_6PtV7svjolgs-rN6stStuHIjs9_DidOHaj0Q-mwvBelOXCFZiq2OsIU-p","author":"xxx","title":"Happy Day","content_source_url":"www.qq.com","content":"content","digest":"digest","show_cover_pic":"0"}]}" "https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=ACCESS_TOKEN"
    
#### parameter:

Parameter    | Description
------------ | -------------
Articles     | news, support 10
thumb_media_id | thumb id
[author]     | author
title        | title
[content_source_url] | source news url
content      | content
[digest]     | description
[show_cover_pic] | whether show cover, 1 for show, 0 for not show

#### return:
    {
       "type":"news",
    "media_id":"CsEf3ldqkAYJAU6EJeIkStVDSvffUJ54vqbThMgplD-VJXXof6ctX5fI6-aYyUiQ",
       "created_at":1391857799
    }
    
Parameter    | Description
------------ | -------------
type         | [image,voice,video,thumb,news]
media_id     | file id
created_at   | upload time


### 7.2 send by group

#### example:
    curl -X POST -d "{"filter":{"group_id":"2"},"mpnews":{"media_id":"123dsdajkasd231jhksad"},"msgtype":"mpnews"}" "https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=ACCESS_TOKEN"
    
    news:
    {
       "filter":{
           "group_id":"2"
        },
       "mpnews":{
          "media_id":"123dsdajkasd231jhksad"
       },
        "msgtype":"mpnews"
    }
    text：
    {
       "filter":{
          "group_id":"2"
       },
       "text":{
          "content":"CONTENT"
       },
        "msgtype":"text"
    }
    voice:
    {
       "filter":{
          "group_id":"2"
       },
       "voice":{
          "media_id":"123dsdajkasd231jhksad"
       },
        "msgtype":"voice"
    }
    image:
    {
       "filter":{
          "group_id":"2"
       },
       "image":{
          "media_id":"123dsdajkasd231jhksad"
       },
        "msgtype":"image"
    }
    video:
    {
       "filter":{
          "group_id":"2"
       },
       "mpvideo":{
          "media_id":"IhdaAQXuvJtGzwwc0abfXnzeezfO0NgPK6AQYShD8RQYMTtfzbLdBIQkQziv2XJc",
       },
        "msgtype":"mpvideo"
    }
    
#### parameter:

Parameter    | Description
------------ | -------------
filter       | filter receivers
group_id     | group id
mpnews       | news
media_id     | media id
msgtype      | [mpnews,text,voice,music,image,video]
[title]      | title
[description] | description
thumb_media_id | thumb id

#### return:
    {
       "errcode":0,
       "errmsg":"send job submission success",
       "msg_id":34182
    }
    
Parameter    | Description
------------ | -------------
type         | [image,voice,video,thumb,news]
errcode      | error code
errmsg       | error message
msg_id       | message id

### 7.3 send by OpenID list

#### example:
    curl -X POST -d "{"filter":{"group_id":"2"},"mpnews":{"media_id":"123dsdajkasd231jhksad"},"msgtype":"mpnews"}" "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN"
    
    news:
    {
       "touser":[
        "OPENID1",
        "OPENID2"
       ],
       "mpnews":{
          "media_id":"123dsdajkasd231jhksad"
       },
        "msgtype":"mpnews"
    }
    text：
    {
       "touser": [
            "oR5Gjjl_eiZoUpGozMo7dbBJ362A",    
            "oR5Gjjo5rXlMUocSEXKT7Q5RQ63Q" 
        ], 
        "msgtype": "text", 
        "text": { 
            "content": "hello from boxer."
        }
    }
    voice:
    {
       "touser":[
        "OPENID1",
        "OPENID2"
       ],
       "voice":{
          "media_id":"mLxl6paC7z2Tl-    NJT64yzJve8T9c8u9K2x-Ai6Ujd4lIH9IBuF6-2r66mamn_gIT"
       },
        "msgtype":"voice"
    }
    image:
    {
       "touser":[
        "OPENID1",
        "OPENID2"
       ],
       "image":{
          "media_id":"BTgN0opcW3Y5zV_ZebbsD3NFKRWf6cb7OPswPi9Q83fOJHK2P67dzxn11Cp7THat"
       },
        "msgtype":"image"
    }
    video:
    {
       "touser":[
        "OPENID1",
        "OPENID2"
       ],
       "video":{
          "media_id":"123dsdajkasd231jhksad",
          "title":"TITLE",
          "description":"DESCRIPTION"
       },
        "msgtype":"video"
    }
    
#### parameter:

Parameter    | Description
------------ | -------------
touser       | receivers, 1~10000
mpnews       | news
media_id     | media id
msgtype      | [mpnews,text,voice,music,image,video]
[title]      | title
[description] | description
thumb_media_id | thumb id

#### return:
    {
       "errcode":0,
       "errmsg":"send job submission success",
       "msg_id":34182
    }
    
Parameter    | Description
------------ | -------------
type         | [image,voice,video,thumb,news]
errcode      | error code
errmsg       | error message
msg_id       | message id

### 7.4 delete group send

#### example:
    curl -X POST -d "{"msg_id":30124}" "https://api.weixin.qq.com/cgi-bin/message/mass/delete?access_token=ACCESS_TOKEN"
    
#### parameter:

Parameter    | Description
------------ | -------------
msg_id       | message id

#### return:
    {
       "errcode":0,
       "errmsg":"ok"
    }
    
Parameter    | Description
------------ | -------------
errcode      | error code
errmsg       | error message

### 7.5 push group send result

#### example:
    
#### parameter:

#### return:
    get after send

    <xml>
    <ToUserName><![CDATA[gh_3e8adccde292]]></ToUserName>
    <FromUserName><![CDATA[oR5Gjjl_eiZoUpGozMo7dbBJ362A]]></FromUserName>
    <CreateTime>1394524295</CreateTime>
    <MsgType><![CDATA[event]]></MsgType>
    <Event><![CDATA[MASSSENDJOBFINISH]]></Event>
    <MsgID>1988</MsgID>
    <Status><![CDATA[sendsuccess]]></Status>
    <TotalCount>100</TotalCount>
    <FilterCount>80</FilterCount>
    <SentCount>75</SentCount>
    <ErrorCount>5</ErrorCount>
    </xml>
    
## 8.template send

### 8.1 get template id

#### example:
    curl -X POST -d "" "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN"
    
    data:
     {
           "touser":"OPENID",
           "template_id":"ngqIpbwh8bUfcSsECmogfXcV14J0tQlEpBO27izEYtY",
           "url":"http://weixin.qq.com/download",
           "topcolor":"#FF0000",
           "data":{
                   "first": {
                       "value":"您好，您已成功消费。",
                       "color":"#0A0A0A"
                   },
                   "keynote1":{
                       "value":"巧克力",
                       "color":"#CCCCCC"
                   },
                   "keynote2": {
                       "value":"39.8元",
                       "color":"#CCCCCC"
                   },
                   "keynote3":{
                       "value":"2014年9月16日",
                       "color":"#CCCCCC"
                   },
                   "remark":{
                       "value":"欢迎再次购买。",
                       "color":"#173177"
                   }
           }
       }
       
#### return:
        {
           "errcode":0,
           "errmsg":"ok",
           "msgid":200228332
       }

### 8.2 push event

#### return:
    success:
    <xml>
           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
           <CreateTime>1395658920</CreateTime>
           <MsgType><![CDATA[event]]></MsgType>
           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
           <MsgID>200163836</MsgID>
           <Status><![CDATA[success]]></Status>
           </xml>
    reject:
    <xml>
           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
           <CreateTime>1395658984</CreateTime>
           <MsgType><![CDATA[event]]></MsgType>
           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
           <MsgID>200163840</MsgID>
           <Status><![CDATA[failed:user block]]></Status>
           </xml>
    fail:
    <xml>
           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
           <CreateTime>1395658984</CreateTime>
           <MsgType><![CDATA[event]]></MsgType>
           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
           <MsgID>200163840</MsgID>
           <Status><![CDATA[failed: system failed]]></Status>
           </xml>
    