-module(wechat_message).
%消息管理
-export([add_kf_account/2, update_kf_account/2, delete_kf_account/2,
    get_kf_list/1, send_message/2, send_message_by_group/2,
    send_message_by_openid_list/2, delete_message/2,
    get_info_of_message/2, set_industry_for_template/2,
    get_industry/1, get_template_id/1, get_private_template_list/1,
    delete_private_template/2, send_template_message/2,
    get_autoreply_info/1]).

-include("include/wechat.hrl").

add_kf_account(AccessToken, Account) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/customservice/kfaccount/add?access_token="++AccessToken),
    AccountBinary = list_to_binary(Account),
    wechat_util:http_post(URL, AccountBinary).

update_kf_account(AccessToken, Account) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/customservice/kfaccount/update?access_token="++AccessToken),
    AccountBinary = list_to_binary(Account),
    wechat_util:http_post(URL, AccountBinary).

delete_kf_account(AccessToken, Account) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/customservice/kfaccount/del?access_token="++AccessToken),
    AccountBinary = list_to_binary(Account),
    wechat_util:http_post(URL, AccountBinary).

get_kf_list(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/customservice/getkflist?access_token="++AccessToken),
    wechat_util:http_get(URL).

send_message(AccessToken, Message) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/custom/send?access_token="++AccessToken),
    MessageBinary = list_to_binary(Message),
    wechat_util:http_post(URL, MessageBinary).

send_message_by_group(AccessToken, Message) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/mass/sendall?access_token="++AccessToken),
    MessageBinary = list_to_binary(Message),
    wechat_util:http_post(URL, MessageBinary).

send_message_by_openid_list(AccessToken, Message) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/mass/send?access_token="++AccessToken),
    MessageBinary = list_to_binary(Message),
    wechat_util:http_post(URL, MessageBinary).

delete_message(AccessToken, MessageId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/mass/delete?access_token="++AccessToken),
    MessageIdBinary = list_to_binary(MessageId),
    wechat_util:http_post(URL, MessageIdBinary).

get_info_of_message(AccessToken, MessageId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/mass/get?access_token="++AccessToken),
    MessageIdBinary = list_to_binary(MessageId),
    wechat_util:http_post(URL, MessageIdBinary).

set_industry_for_template(AccessToken, Industry) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/template/api_set_industry?access_token="++AccessToken),
    IndustryBinary = list_to_binary(Industry),
    wechat_util:http_post(URL, IndustryBinary).

get_industry(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/template/get_industry?access_token="++AccessToken),
    wechat_util:http_get(URL).

get_template_id(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/template/api_add_template?access_token="++AccessToken),
    wechat_util:http_get(URL).

get_private_template_list(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/template/get_all_private_template?access_token="++AccessToken),
    wechat_util:http_get(URL).

delete_private_template(AccessToken, TemplateId) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/template/del_private_template?access_token="++AccessToken),
    TemplateIdBinary = list_to_binary(TemplateId),
    wechat_util:http_post(URL, TemplateIdBinary).

send_template_message(AccessToken, Message) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/message/template/send?access_token="++AccessToken),
    MessageBinary = list_to_binary(Message),
    wechat_util:http_post(URL, MessageBinary).

get_autoreply_info(AccessToken) ->
    URL = list_to_binary(?API_URL_PREFIX ++ "/cgi-bin/get_current_autoreply_info?access_token="++AccessToken),
    wechat_util:http_get(URL).
