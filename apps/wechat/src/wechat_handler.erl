-module(wechat_handler).

-export([init/3, handle/2, terminate/3]).

init(_, Req, Opts) ->
    {Signature, _Req} = cowboy_req:qs_val(<<"signature">>, Req),
    {Timestamp, _Req} = cowboy_req:qs_val(<<"timestamp">>, Req),
    {Nonce, _Req} = cowboy_req:qs_val(<<"nonce">>, Req),
	Result = wechat_signature:check(binary_to_list(Signature), binary_to_list(Timestamp), binary_to_list(Nonce)),
	if
		Result == false ->
			{error, Req, Opts};
		true ->
			Req2 = cowboy_req:reply(200, [
		        {<<"content-type">>, <<"text/plain">>}
		    ], <<"Hello world!">>, Req),
		    {ok, Req2, Opts}
	end.

handle(Req, State) ->
    {ok, Req2} = cowboy_req:reply(200, [
        {<<"content-type">>, <<"text/plain">>}
    ], <<"Hello World!">>, Req),
    {ok, Req2, State}.

terminate(_Reason, Req, State) ->
    ok.
