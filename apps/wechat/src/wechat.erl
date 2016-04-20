-module(wechat).

-export([get_access_token/2, get_callback_ip/1]).

-include("include/wechat.hrl").

%{"access_token":"ACCESS_TOKEN","expires_in":7200}
get_access_token(AppId, AppSecret) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/token?grant_type=client_credential&appid="++AppId++"&secret="++ApAppSecret),
    wechat_util:http_get(URL).

%{"ip_list": ["127.0.0.1", "127.0.0.2", "101.226.103.0/25"]}
get_callback_ip(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/getcallbackip?access_token="++AccessToken),
    wechat_util:http_get(URL).

%{"errcode":0,"errmsg":"ok"}
create_menu(AccessToken, Menu) ->
    wechat_menu:create(AccessToken, Menu).

test() ->
    Method = get,
    URL = list_to_binary(?API_URL_PREFIX ++ "/token?grant_type=client_credential&appid=wx3d5d6bb960219d5c&secret=124b1056f0c8d06840a95dead1668d43"),
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, _StatusCode, _RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    io:fwrite("~p~n", [{Body}]).

test2(AccessToken) ->
    Method = get,
    URL = list_to_binary(?API_URL_PREFIX ++ "/user/get?access_token=" ++ AccessToken ++ "&next_openid="),
    Headers = [{<<"Content-Type">>, <<"application/json">>}],
    Payload = <<>>,
    Options = [],
    {ok, _StatusCode, _RespHeaders, ClientRef} = hackney:request(Method, URL, Headers, Payload, Options),
    {ok, Body} = hackney:body(ClientRef),
    Response = jiffy:decode(Body),
    [H|_T] = element(1, Response),
    % {{<<"total">>,5}}
    io:fwrite("~p~n", [{H}]).
