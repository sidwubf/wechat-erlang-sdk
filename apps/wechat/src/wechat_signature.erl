-module(wechat_signature).

-export([check/3]).

check(Signature, Timestamp, Nonce) ->
    Token = "yourtoken",
    TmpList = [Token, Timestamp, Nonce],
    TmpList2 = lists:sort(TmpList),
    TmpStr = string:join(TmpList2, ""),
    Hash = wechat_util:hexstring(TmpStr),
    string:equal(Signature, Hash).
