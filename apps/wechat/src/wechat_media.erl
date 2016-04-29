-module(wechat_media).
%素材管理
-export([get_media/2, add_news/2, get_material/2, delete_material/2,
        update_news/2, get_material_count/1, get_batch_material/2]).

get_media(AccessToken, MediaId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/media/get?access_token="++AccessToken++"&media_id="++MediaId),
    wechat_util:http_get(URL).

add_news(AccessToken, News) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/add_news?access_token="++AccessToken),
    NewsBinary = list_to_binary(News),
    wechat_util:http_post(URL, NewsBinary).

get_material(AccessToken, MediaId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/get_material?access_token="++AccessToken),
    MediaIdBinary = list_to_binary(MediaId),
    wechat_util:http_post(URL, MediaIdBinary).

delete_material(AccessToken, MediaId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/del_material?access_token="++AccessToken),
    MediaIdBinary = list_to_binary(MediaId),
    wechat_util:http_post(URL, MediaIdBinary).

update_news(AccessToken, News) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/update_news?access_token="++AccessToken),
    NewsBinary = list_to_binary(News),
    wechat_util:http_post(URL, NewsBinary).

get_material_count(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/get_materialcount?access_token="++AccessToken),
    wechat_util:http_get(URL).

get_batch_material(AccessToken, Query) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/material/batchget_material?access_token="++AccessToken),
    QueryBinary = list_to_binary(Query),
    wechat_util:http_post(URL, QueryBinary).
