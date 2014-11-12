-module(wechat_test).

-include("../include/wechat.hrl").
-include_lib("eunit/include/eunit.hrl").

start() ->
    ok.

stop() ->
    ok.

init() ->
    ok = application:start(asn1),
    ok = application:start(public_key),
    ok = application:start(ssl),
    ok = application:start(cowlib),
    ok = application:start(ranch),
    ok = application:start(gun),
    ok = application:start(wechat).

get_access_token_test() ->
    %init(),
    %AppID = "",
    %Secret = "",
    %[Pid, Ref, Status, Headers] = wechat:get_access_token(AppID, Secret),
    %ct:print("response ~p ~p", [Status, Headers]),
    %data_loop(Pid, Ref).
    ok.

send_message_test() ->
    init(),
    AccessToken = "",
    OpenID = "",
    Content = "testtest",
    [Pid, Ref, Status, Headers] = wechat:send_message(text, AccessToken, OpenID, Content),
    ct:print("response ~p ~p", [Status, Headers]),
    data_loop(Pid, Ref).

data_loop(Pid, Ref) ->
	receive
		{gun_data, Pid, Ref, nofin, Data} ->
			ct:print("data ~p", [Data]),
			data_loop(Pid, Ref);
		{gun_data, Pid, Ref, fin, Data} ->
			ct:print("data ~p~nend", [Data])
	after 5000 ->
		error(timeout)
	end.

