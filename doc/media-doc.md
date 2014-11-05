# Media API

## 1.Upload

### example:

    curl -X POST -F media=@test.jpg "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE"
    
### parameter:
    
Parameter    | Description
------------ | -------------
access_token | api certificate 
type         | media type[image, voice, video, thumb] 
media        | form-data, such as filename, file length, content-type...

### return:

    {"type":"TYPE","media_id":"MEDIA_ID","created_at":123456789}
    
Parameter    | Description
------------ | -------------
type         | media type[image, voice, video, thumb]
media_id     | unique id after upload 
created_at   | upload time

### notice:
* image type: 1M, JPG
* voice type: 2M, <= 60s, AMR\MP3
* video type: 10MB, MP4
* thumb type: 64KB, JPG

expire 3 days

## 2.Download

### example:

    curl -X GET "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID"
    
### parameter:
    
Parameter    | Description
------------ | -------------
access_token | api certificate 
media_id     | media id

### return:

    HTTP/1.1 200 OK
    Connection: close
    Content-Type: image/jpeg 
    Content-disposition: attachment; filename="MEDIA_ID.jpg"
    Date: Sun, 06 Jan 2013 10:20:18 GMT
    Cache-Control: no-cache, must-revalidate
    Content-Length: 339721
    
    {"errcode":40007,"errmsg":"invalid media_id"}
