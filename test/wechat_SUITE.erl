-module(wechat_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([get_access_token_test/1]).

all() ->
    [get_access_token_test].

get_access_token_test(_Config) ->
    AppID = "wxb87543276eeccb37",
    Secret = "eae2b0571bb29aef55691023b7c32df4",
    StreamRef = wechat_sdk:get_access_token(AppID, Secret),
    StreamRef.

