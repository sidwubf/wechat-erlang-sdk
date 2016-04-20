-module(wechat).

-export([get_access_token/2, get_callback_ip/1]).
-export([create_menu/2]).

-include("include/wechat.hrl").

%{"access_token":"ACCESS_TOKEN","expires_in":7200}
get_access_token(AppId, AppSecret) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/token?grant_type=client_credential&appid="++AppId++"&secret="++AppSecret),
    wechat_util:http_get(URL).

%{"ip_list": ["127.0.0.1", "127.0.0.2", "101.226.103.0/25"]}
get_callback_ip(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/getcallbackip?access_token="++AccessToken),
    wechat_util:http_get(URL).

%{"errcode":0,"errmsg":"ok"}
create_menu(AccessToken, Menu) ->
    wechat_menu:create(AccessToken, Menu).
