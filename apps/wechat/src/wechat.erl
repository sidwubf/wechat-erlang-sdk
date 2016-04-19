-module(wechat).

-export([test/0]).

-include("wechat.hrl").

test() ->
    Method = get,
    URL = <<?API_URL_PREFIX ++ "/token?grant_type=client_credential&appid=wx3d5d6bb960219d5c&secret=124b1056f0c8d06840a95dead1668d43">>,
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, StatusCode, RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    io:fwrite("~s~n", [{Body}]).
