-module(wechat_test).

-include("../include/wechat.hrl").
-include_lib("eunit/include/eunit.hrl").

get_access_token_test() ->
    ok = application:start(asn1),
    ok = application:start(public_key),
    ok = application:start(ssl),
    ok = application:start(cowlib),
    ok = application:start(ranch),
    ok = application:start(gun),
    ok = application:start(wechat),
    AppID = "wxb87543276eeccb37",
    Secret = "eae2b0571bb29aef55691023b7c32df4",
    [Pid, Ref, Status, Headers] = wechat:get_access_token(AppID, Secret),
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
