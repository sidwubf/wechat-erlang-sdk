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
    %AppID = "wxcd697bc41a293252",
    %Secret = "85d7efb759a43bfdb3c4cf1d63eb7bed",
    %[Pid, Ref, Status, Headers] = wechat:get_access_token(AppID, Secret),
    %ct:print("response ~p ~p", [Status, Headers]),
    %data_loop(Pid, Ref).
    ok.

send_message_test() ->
    init(),
    AccessToken = "RpnLPtqfF5CkztaX9KVtd9_eqS3uTwk41ZIpEvw9tbATQZ3wrt9FqAd4i6vXaLkHeF9gv8S8GiJ-piS2FIf6stkPoQgL5jQsIrO316IK-3E",
    OpenID = "oQcZOuAKaTiRXr6j0XjG00bWrzM4",
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

