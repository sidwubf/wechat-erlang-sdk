-module(wechat_test).

-export([test_get_access_token/0]).

test_get_access_token() ->
    ok = application:start(gun),
    ok = application:start(wechat),
    AppID = "wxb87543276eeccb37",
    Secret = "eae2b0571bb29aef55691023b7c32df4",
    StreamRef = wechat:get_access_token(AppID, Secret),
    ok.
