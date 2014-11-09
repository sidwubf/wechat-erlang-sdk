-module(wechat).

-export([get_access_token/2]).
-export([send_text_message/3]).

-include("include/wechat.hrl").

get_access_token(AppID, Secret) ->
    get_access_token(AppID, Secret, "client_credential").

get_access_token(AppID, Secret, GrantType) ->
    {ok, Pid} = gun:open(?WECHAT_API_URI, 443),
    Path = "/cgi-bin/token?grant_type="++GrantType++"&appid="++AppID++"&secret="++Secret,
    StreamRef = gun:get(Pid, Path),
    gun:close(Pid),
    StreamRef.

send_text_message(AccessToken, OpenID, Content) ->
    {ok, Pid} = gun:open(?WECHAT_API_URI, 443),
    Path = "/cgi-bin/message/custom/send?access_token=" ++ AccessToken,
    Headers = [
               {"accept", "*/*"},
               {"user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"},
               {"referer", "https://mp.weixin.qq.com/"},
               {"accept-encoding", "gzip,deflate"},
               {"accept-language", "zh-CN,zh;q=0.8"},
               {"content-type", "application/x-www-form-urlencoded; charset=UTF-8"}
              ],
    Body = "{\"touser\":\""++OpenID++"\",\"msgtype\":\"text\",\"text\":{\"content\":\""++Content++"\"}}",
    StreamRef = gun:post(Pid, Path, Headers, Body),
    gun:close(Pid),
    StreamRef.

