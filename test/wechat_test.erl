-module(wechat_test).

-include("../include/wechat.hrl").
-include_lib("eunit/include/eunit.hrl").

get_access_token_test() ->
    AppID = "wxb87543276eeccb37",
    Secret = "eae2b0571bb29aef55691023b7c32df4",
    StreamRef = wechat_sdk:get_access_token(AppID, Secret),
    ?debugMsg(StreamRef).
