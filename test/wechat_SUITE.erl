-module(wechat_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([get_access_token_test/1]).

all() ->
    [get_access_token_test].

get_access_token_test(_Config) ->
    AppID = "",
    Secret = "",
    StreamRef = wechat_sdk:get_access_token(AppID, Secret),
    StreamRef.

