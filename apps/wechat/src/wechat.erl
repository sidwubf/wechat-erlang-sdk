-module(wechat).

-export([test/0, test2/1]).

-include("include/wechat.hrl").

test() ->
    Method = get,
    URL = <<"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx3d5d6bb960219d5c&secret=124b1056f0c8d06840a95dead1668d43">>,
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, StatusCode, RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    io:fwrite("~p~n", [{Body}]).

test2(AccessToken) ->
    Method = get,
    URL = list_to_binary(?API_URL_PREFIX ++ "/user/get?access_token=" ++ AccessToken ++ "&next_openid="),
    io:fwrite("~p~n", [{URL}]),
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, StatusCode, RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    io:fwrite("~p~n", [{Body}]).
