-module(bench_erlack_param20).

-compile({parse_transform, erlack_url_dispatch}).

-export([url_dispatch/1, url_reverse/2]).

-export([handle/3]).

-export([id/1]).

-pattern(
   { param,
     "[A-Za-z0-9_]+",
     {?MODULE, id},
     {?MODULE, id}
   }).

-dispatch({root, "{a:param}/{b:param}/{c:param}/{d:param}/{e:param}/{f:param}/{g:param}/{h:param}/{i:param}/{j:param}/{k:param}/{l:param}/{m:param}/{n:param}/{o:param}/{p:param}/{q:param}/{r:param}/{s:param}/{t:param}", {endpoint, test}}).

id(X) -> X.

handle(<<"GET">>, test, #{}) ->
    {response, {200, <<"OK">>}, #{}, <<"OK">>};
handle(_, _, _) ->
    {response, {405, <<"Method Not Allowed">>}, #{}, <<"Method Not Allowed">>}.
