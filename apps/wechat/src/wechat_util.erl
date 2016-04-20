-module(wechat_util).

-export([http_get/1, http_post/2]).

http_get(URL) ->
    Method = get,
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, _StatusCode, _RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    Response = jiffy:decode(Body),
    Response.

http_post(URL, Body) ->
    Method = post,
    ReqHeaders = [{<<"Content-Type">>, <<"application/json">>}],
    {ok, ClientRef} = hackney:request(Method, URL, ReqHeaders, stream, []),
    ok  = hackney:send_body(ClientRef, Body),
    {ok, _Status, _Headers, ClientRef} = hackney:start_response(ClientRef),
    {ok, Body} = hackney:body(ClientRef),
    Response = jiffy:decode(Body),
    Response.
