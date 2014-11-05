# Encoding Encrypt

## 1.Encrypt

    url?encrypt=[:encrypt]
    encrypt=aes encrypt
    encrypt=raw not encrypt
    

    <xml>
	    <ToUserName><![CDATA[toUser]]></ToUserName>
	    <FromUserName><![CDATA[fromUser]]></FromUserName> 
	    <CreateTime>1348831860</CreateTime>
	    <MsgType><![CDATA[text]]></MsgType>
	    <Content><![CDATA[this is a test]]></Content>
	    <MsgId>1234567890123456</MsgId>
    </xml>
    
    new_msg=
    <xml> 
	    <ToUserName><![CDATA[toUser]]</ToUserName>
        <Encrypt><![CDATA[msg_encrypt]]</Encrypt>
    </xml>
    
    msg_encrypt = Base64_Encode( AES_Encrypt[ random(16B) +     msg_len(4B) + msg + $AppId] )
    
    msg_signature=sha1(sort(Token、timestamp、nonce, msg_encrypt))
    
    http://mp.weixin.qq.com/wiki/downloads/SampleCode.zip