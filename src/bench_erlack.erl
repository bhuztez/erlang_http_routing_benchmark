-module(bench_erlack).

-export([run/3]).

module_of(static) -> bench_erlack_static;
module_of(param) -> bench_erlack_param;
module_of(param5) -> bench_erlack_param5;
module_of(param20) -> bench_erlack_param20;
module_of(param_write) -> bench_erlack_param_write;
module_of(parse) -> bench_erlack_parse;
module_of(gplus) -> bench_erlack_gplus.

not_found() ->
    {response, {404, <<"Not Found">>}, #{}, <<"Not Found">>}.

run(Handler, Method, Path) ->
    Module = module_of(Handler),
    erase(),
    put(<<"REQUEST_METHOD">>, Method),
    put(<<"REQUEST_URI">>, Path),
    {response, {200, _}, _, _} =
        erlack_routing:middleware(
          fun() -> Module:handle(get(<<"REQUEST_METHOD">>), get(erlack_endpoint), get(erlack_args)) end,
          Module,
          fun not_found/0).
