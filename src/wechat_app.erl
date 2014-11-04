-module(wechat_app).

-behavior(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    wechat_sup:start_link().

stop(_State) ->
    ok.

