-module(wechat).

-export([start/0, stop/0]).

-export([get_access_token/2]).
-export([send_text_message/3]).

-include("include/wechat.hrl").

start() ->
    ok.

stop() ->
    ok.

get_access_token(AppID, Secret) ->
    get_access_token(AppID, Secret, "client_credential").

get_access_token(AppID, Secret, GrantType) ->
    {ok, Pid} = gun:open(?WECHAT_API_URI, 443),
    Path = "/cgi-bin/token?grant_type="++GrantType++"&appid="++AppID++"&secret="++Secret,
    Ref = gun:get(Pid, Path),
    receive
		{gun_response, Pid, Ref, nofin, Status, Headers} ->
            [Pid, Ref, Status, Headers]
	after 5000 ->
		error(timeout)
	end.

send_text_message(AccessToken, OpenID, Content) ->
    {ok, Pid} = gun:open(?WECHAT_API_URI, 443),
    Path = "/cgi-bin/message/custom/send?access_token=" ++ AccessToken,
    Headers = [
               {"accept", "*/*"},
               {"user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"},
               {"referer", "https://mp.weixin.qq.com/"},
               {"accept-encoding", "gzip,deflate"},
               {"accept-language", "zh-CN,zh;q=0.8"},
               {"content-type", "application/x-www-form-urlencoded; charset=UTF-8"}
              ],
    Body = "{\"touser\":\""++OpenID++"\",\"msgtype\":\"text\",\"text\":{\"content\":\""++Content++"\"}}",
    StreamRef = gun:post(Pid, Path, Headers, Body),
    gun:close(Pid),
    StreamRef.

to_string(Binary) when is_binary(Binary) ->
    binary_to_list(Binary);
to_string(Integer) when is_integer(Integer) ->
    integer_to_list(Integer);
to_string(Float) when is_float(Float) ->
    float_to_list(Float);
to_string(Atom) when Atom =:= undefined; Atom =:= null ->
    "";
to_string(Atom) when is_atom(Atom) ->
    atom_to_list(Atom);
to_string({{Year, Month, Day}, {Hour, Min, Sec}}) ->
    lists:flatten(io_lib:format("~.04w-~.02w-~.02wT~.02w:~.02w:~.02wZ", [Year, Month, Day, Hour, Min, Sec]));
to_string(String) ->
    String.
