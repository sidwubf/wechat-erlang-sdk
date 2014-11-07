-module(wechat).

-export([test/0]).

test() ->
    Access_Token = "fjoajfoawjfoawjofjwaofj",
    {ok, Pid} = gun:open("api.weixin.qq.com", 443),
    StreamRef = gun:post(Pid, "/cgi-bin/message/custom/send?access_token="++Access_Token, [], []),
    gun:close(Pid).
