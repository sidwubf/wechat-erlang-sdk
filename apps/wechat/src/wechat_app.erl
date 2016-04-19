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
    application:start(crypto),
    application:start(public_key),
    application:start(ssl),
    application:start(hackney),
    application:start(jiffy),
    wechat_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
