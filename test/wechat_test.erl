-module(wechat_test).
-include_lib("common_test/include/ct.hrl").

-export([all/0]).
-export([test_get_access_token/0]).

all() ->
    [test_get_access_token].

test_get_access_token() ->
    ok = application:start(gun),
    ok = application:start(wechat),
    AppID = "wxb87543276eeccb37",
    Secret = "eae2b0571bb29aef55691023b7c32df4",
    StreamRef = wechat:get_access_token(AppID, Secret),
    StreamRef.
