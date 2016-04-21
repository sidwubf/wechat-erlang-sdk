-module(wechat_menu).
%自定义菜单
-export([create/2, get/1, delete/1, add_conditional/2, get_info/1]).

-include("include/wechat.hrl").

create(AccessToken, Menu) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/menu/create?access_token="++AccessToken),
    MenuBinary = list_to_binary(Menu),
    wechat_util:http_post(URL, MenuBinary).

get(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/menu/get?access_token="++AccessToken),
    wechat_util:http_get(URL).

delete(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/menu/delete?access_token="++AccessToken),
    wechat_util:http_get(URL).

add_conditional(AccessToken, MenuConditional) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/menu/addconditional?access_token="++AccessToken),
    MenuConditionalBinary = list_to_binary(MenuConditional),
    wechat_util:http_post(URL, MenuConditionalBinary).

get_info(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/get_current_selfmenu_info?access_token="++AccessToken),
    wechat_util:http_get(URL).
