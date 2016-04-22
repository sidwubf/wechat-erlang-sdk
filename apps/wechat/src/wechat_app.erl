%%%-------------------------------------------------------------------
%% @doc wechat public API
%% @end
%%%-------------------------------------------------------------------

-module(wechat_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    application:start(cowboy),
    application:start(crypto),
    application:start(public_key),
    application:start(ssl),
    application:start(hackney),
    application:start(jiffy),
    Dispatch = cowboy_router:compile([
		{'_', [
			{"/wechat", wechat_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 8081}], [
		{env, [{dispatch, Dispatch}]}
	]),
    wechat_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
