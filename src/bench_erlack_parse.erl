-module(bench_erlack_parse).

-compile({parse_transform, erlack_url_dispatch}).

-export([url_dispatch/1, url_reverse/2]).

-export([handle/3]).

-export([id/1]).

-pattern(
   { integer,
     "[0-9]+",
     {erlang, binary_to_integer},
     {erlang, integer_to_binary}
   }).


-pattern(
   { param,
     "[A-Za-z0-9_]+",
     {?MODULE, id},
     {?MODULE, id}
   }).

-dispatch({root, "1/", {dispatch, v1}}).

-dispatch({v1, "classes/", {dispatch, objects}}).

-dispatch({objects, "{name:param}", {endpoint, class}}).
-dispatch({objects, "{name:param}/{object_id:integer}", {endpoint, object}}).

-dispatch({v1, "login", {endpoint, login}}).
-dispatch({v1, "requestPasswordReset", {endpoint, reset_password}}).
-dispatch({v1, "users", {endpoint, users}}).
-dispatch({v1, "users/{object_id:integer}", {endpoint, user}}).

-dispatch({v1, "roles", {endpoint, roles}}).
-dispatch({v1, "roles/{object_id:integer}", {endpoint, role}}).

-dispatch({v1, "files/{name:param}", {endpoint, file}}).
-dispatch({v1, "events/{name:param}", {endpoint, event}}).

-dispatch({v1, "push", {endpoint, push}}).

-dispatch({v1, "installations", {endpoint, installations}}).
-dispatch({v1, "installations/{object_id:integer}", {endpoint, installation}}).

-dispatch({v1, "functions", {endpoint, functions}}).


id(X) -> X.

handle(M, E, #{}) 
  when (M =:= <<"GET">>) or (M =:= <<"POST">>), (E =:= class) or (E =:= users) or (E =:= roles) or (E =:= installations);
       (M =:= <<"GET">>) or (M =:= <<"PUT">>) or (M =:= <<"DELETE">>), (E =:= object) or (E =:= user) or (E =:= role) or (E =:= installation);
       (M =:= <<"POST">>), (E =:= file) or (E =:= event) or (E =:= push) or (E =:= functions) or (E =:= reset_password);
       M =:= <<"GET">>, E =:= login ->
    {response, {200, <<"OK">>}, #{}, <<"OK">>};
handle(_, _, _) ->
    {response, {405, <<"Method Not Allowed">>}, #{}, <<"Method Not Allowed">>}.
