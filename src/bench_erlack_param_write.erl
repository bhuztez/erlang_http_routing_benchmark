-module(bench_erlack_param_write).

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

-dispatch({root, "user/{name:param}", {endpoint, user}}).

id(X) -> X.

handle(<<"GET">>, user, #{name := Name}) ->
    ok = file:write_file("/dev/null", Name),
    {response, {200, <<"OK">>}, #{}, <<"OK">>};
handle(_, _, _) ->
    {response, {405, <<"Method Not Allowed">>}, #{}, <<"Method Not Allowed">>}.
