-module(bench_erlack_gplus).

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


-dispatch({root, "people", {dispatch, people}}).
-dispatch({root, "activities", {dispatch, activities}}).
-dispatch({root, "comments/{id:integer}", {endpoint, comment}}).
-dispatch({root, "moments/{id:integer}", {endpoint, moment}}).


-dispatch({people, "", {endpoint, people}}).
-dispatch({people, "/{id:integer}", {dispatch, person}}).
-dispatch({person, "", {endpoint, person}}).
-dispatch({person, "/people/{collection:integer}", {endpoint, people_in_collection}}).
-dispatch({person, "/openIdConnect", {endpoint, openid_connect}}).
-dispatch({person, "/activities/{collection:integer}", {endpoint, people_activities}}).
-dispatch({person, "/moments/{collection:integer}", {endpoint, people_moments}}).

-dispatch({activities, "", {endpoint, activities}}).
-dispatch({activities, "/{id:integer}", {dispatch, activity}}).
-dispatch({activity, "", {endpoint, activity}}).
-dispatch({activity, "/people/{collection:integer}", {endpoint, people_in_activity}}).
-dispatch({activity, "/comments", {endpoint, comments}}).


id(X) -> X.

handle(M, E, #{}) 
  when M =:= <<"GET">>, (E =:= person) or (E =:= people) or (E =:= people_in_activity) or (E =:= people_in_collection) or (E =:= openid_connect) or (E =:= people_activities) or (E =:= activity) or (E =:= activities) or (E =:= comments) or (E =:= comment);
       (M =:= <<"POST">>) or (M =:= <<"GET">>), E =:= people_moments;
       M =:= <<"DELETE">>, E =:= moment ->
    {response, {200, <<"OK">>}, #{}, <<"OK">>};
handle(_, _, _) ->
    {response, {405, <<"Method Not Allowed">>}, #{}, <<"Method Not Allowed">>}.
