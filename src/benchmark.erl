-module(benchmark).

-export([all/0, format/0, format/1, run/3]).

-export(
   [static/0,
    param/0,
    param5/0,
    param20/0,
    param_write/0,
    parse_static/0,
    parse_param/0,
    parse_2params/0,
    parse_all/0,
    gplus_static/0,
    gplus_param/0,
    gplus_2params/0,
    gplus_all/0]).

all() ->
    Benchmarks =
        [
         {static,        plain,    10000},
         {param,         plain,  2000000},
         {param5,        plain,   500000},
         {param20,       plain,   200000},
         {param_write,   plain,   100000},
         {parse_static,  plain,  2000000},
         {parse_param,   plain,  2000000},
         {parse_2params, plain,  2000000},
         {parse_all,     plain,    50000},
         {gplus_static,  plain,  2000000},
         {gplus_param,   plain,  2000000},
         {gplus_2params, plain,  1000000},
         {gplus_all,     plain,   100000},

         {static,        erlack,    2000},
         {param,         erlack,  500000},
         {param5,        erlack,  200000},
         {param20,       erlack,  100000},
         {param_write,   erlack,   50000},
         {parse_static,  erlack, 1000000},
         {parse_param,   erlack,  500000},
         {parse_2params, erlack,  200000},
         {parse_all,     erlack,   20000},
         {gplus_static,  erlack, 1000000},
         {gplus_param,   erlack,  200000},
         {gplus_2params, erlack,  200000},
         {gplus_all,     erlack,   20000}
        ],
    [ {B,F,T,run(B,F,T)} || {B,F,T} <- Benchmarks].

format() ->
    format(all()).

format(Results) ->
    [ case R of
          {ok, MS} ->
              io:format("~p ~p: ~p ops in ~p ms, ~.1f ns/op~n", [B,F,T,MS,MS/T * 1000000]);
          {error, _} ->
              io:format("~p ~p error~n", [B,F])
      end
     || {B,F,T,R} <- Results],
    ok.

module_of(plain) ->
    bench_plain;
module_of(erlack) ->
    bench_erlack.


run(Benchmark, Framework, Times) ->
    {Handler, Requests} = ?MODULE:Benchmark(),
    Module = module_of(Framework),
    {Before, _} = statistics(runtime),
    {Pid, Ref} =
        spawn_opt(
          fun () -> repeat(Times, Module, Handler, Requests) end,
          [monitor, {priority, max}]
         ),
    receive
        {'DOWN', Ref, process, Pid, Reason} ->
            case Reason of
                normal ->
                    {After, _} = statistics(runtime),
                    {ok, After - Before};
                _ ->
                    {error, Reason}
            end
    end.

repeat(0, _, _, _) ->
    ok;
repeat(Times, Module, Handler, Requests) ->
    run_benchmark(Module, Handler, Requests),
    repeat(Times-1, Module, Handler, Requests).

run_benchmark(_, _, []) ->
    ok;
run_benchmark(Module, Handler, [{M,P}|T]) ->
    Module:run(Handler, M, P),
    run_benchmark(Module, Handler, T).

static() ->
    {static,
     [{<<"GET">>, <<"/">>},
      {<<"GET">>, <<"/cmd.html">>},
      {<<"GET">>, <<"/code.html">>},
      {<<"GET">>, <<"/contrib.html">>},
      {<<"GET">>, <<"/contribute.html">>},
      {<<"GET">>, <<"/debugging_with_gdb.html">>},
      {<<"GET">>, <<"/docs.html">>},
      {<<"GET">>, <<"/effective_go.html">>},
      {<<"GET">>, <<"/files.log">>},
      {<<"GET">>, <<"/gccgo_contribute.html">>},
      {<<"GET">>, <<"/gccgo_install.html">>},
      {<<"GET">>, <<"/go-logo-black.png">>},
      {<<"GET">>, <<"/go-logo-blue.png">>},
      {<<"GET">>, <<"/go-logo-white.png">>},
      {<<"GET">>, <<"/go1.1.html">>},
      {<<"GET">>, <<"/go1.2.html">>},
      {<<"GET">>, <<"/go1.html">>},
      {<<"GET">>, <<"/go1compat.html">>},
      {<<"GET">>, <<"/go_faq.html">>},
      {<<"GET">>, <<"/go_mem.html">>},
      {<<"GET">>, <<"/go_spec.html">>},
      {<<"GET">>, <<"/help.html">>},
      {<<"GET">>, <<"/ie.css">>},
      {<<"GET">>, <<"/install-source.html">>},
      {<<"GET">>, <<"/install.html">>},
      {<<"GET">>, <<"/logo-153x55.png">>},
      {<<"GET">>, <<"/Makefile">>},
      {<<"GET">>, <<"/root.html">>},
      {<<"GET">>, <<"/share.png">>},
      {<<"GET">>, <<"/sieve.gif">>},
      {<<"GET">>, <<"/tos.html">>},
      {<<"GET">>, <<"/articles/">>},
      {<<"GET">>, <<"/articles/go_command.html">>},
      {<<"GET">>, <<"/articles/index.html">>},
      {<<"GET">>, <<"/articles/wiki/">>},
      {<<"GET">>, <<"/articles/wiki/edit.html">>},
      {<<"GET">>, <<"/articles/wiki/final-noclosure.go">>},
      {<<"GET">>, <<"/articles/wiki/final-noerror.go">>},
      {<<"GET">>, <<"/articles/wiki/final-parsetemplate.go">>},
      {<<"GET">>, <<"/articles/wiki/final-template.go">>},
      {<<"GET">>, <<"/articles/wiki/final.go">>},
      {<<"GET">>, <<"/articles/wiki/get.go">>},
      {<<"GET">>, <<"/articles/wiki/http-sample.go">>},
      {<<"GET">>, <<"/articles/wiki/index.html">>},
      {<<"GET">>, <<"/articles/wiki/Makefile">>},
      {<<"GET">>, <<"/articles/wiki/notemplate.go">>},
      {<<"GET">>, <<"/articles/wiki/part1-noerror.go">>},
      {<<"GET">>, <<"/articles/wiki/part1.go">>},
      {<<"GET">>, <<"/articles/wiki/part2.go">>},
      {<<"GET">>, <<"/articles/wiki/part3-errorhandling.go">>},
      {<<"GET">>, <<"/articles/wiki/part3.go">>},
      {<<"GET">>, <<"/articles/wiki/test.bash">>},
      {<<"GET">>, <<"/articles/wiki/test_edit.good">>},
      {<<"GET">>, <<"/articles/wiki/test_Test.txt.good">>},
      {<<"GET">>, <<"/articles/wiki/test_view.good">>},
      {<<"GET">>, <<"/articles/wiki/view.html">>},
      {<<"GET">>, <<"/codewalk/">>},
      {<<"GET">>, <<"/codewalk/codewalk.css">>},
      {<<"GET">>, <<"/codewalk/codewalk.js">>},
      {<<"GET">>, <<"/codewalk/codewalk.xml">>},
      {<<"GET">>, <<"/codewalk/functions.xml">>},
      {<<"GET">>, <<"/codewalk/markov.go">>},
      {<<"GET">>, <<"/codewalk/markov.xml">>},
      {<<"GET">>, <<"/codewalk/pig.go">>},
      {<<"GET">>, <<"/codewalk/popout.png">>},
      {<<"GET">>, <<"/codewalk/run">>},
      {<<"GET">>, <<"/codewalk/sharemem.xml">>},
      {<<"GET">>, <<"/codewalk/urlpoll.go">>},
      {<<"GET">>, <<"/devel/">>},
      {<<"GET">>, <<"/devel/release.html">>},
      {<<"GET">>, <<"/devel/weekly.html">>},
      {<<"GET">>, <<"/gopher/">>},
      {<<"GET">>, <<"/gopher/appenginegopher.jpg">>},
      {<<"GET">>, <<"/gopher/appenginegophercolor.jpg">>},
      {<<"GET">>, <<"/gopher/appenginelogo.gif">>},
      {<<"GET">>, <<"/gopher/bumper.png">>},
      {<<"GET">>, <<"/gopher/bumper192x108.png">>},
      {<<"GET">>, <<"/gopher/bumper320x180.png">>},
      {<<"GET">>, <<"/gopher/bumper480x270.png">>},
      {<<"GET">>, <<"/gopher/bumper640x360.png">>},
      {<<"GET">>, <<"/gopher/doc.png">>},
      {<<"GET">>, <<"/gopher/frontpage.png">>},
      {<<"GET">>, <<"/gopher/gopherbw.png">>},
      {<<"GET">>, <<"/gopher/gophercolor.png">>},
      {<<"GET">>, <<"/gopher/gophercolor16x16.png">>},
      {<<"GET">>, <<"/gopher/help.png">>},
      {<<"GET">>, <<"/gopher/pkg.png">>},
      {<<"GET">>, <<"/gopher/project.png">>},
      {<<"GET">>, <<"/gopher/ref.png">>},
      {<<"GET">>, <<"/gopher/run.png">>},
      {<<"GET">>, <<"/gopher/talks.png">>},
      {<<"GET">>, <<"/gopher/pencil/">>},
      {<<"GET">>, <<"/gopher/pencil/gopherhat.jpg">>},
      {<<"GET">>, <<"/gopher/pencil/gopherhelmet.jpg">>},
      {<<"GET">>, <<"/gopher/pencil/gophermega.jpg">>},
      {<<"GET">>, <<"/gopher/pencil/gopherrunning.jpg">>},
      {<<"GET">>, <<"/gopher/pencil/gopherswim.jpg">>},
      {<<"GET">>, <<"/gopher/pencil/gopherswrench.jpg">>},
      {<<"GET">>, <<"/play/">>},
      {<<"GET">>, <<"/play/fib.go">>},
      {<<"GET">>, <<"/play/hello.go">>},
      {<<"GET">>, <<"/play/life.go">>},
      {<<"GET">>, <<"/play/peano.go">>},
      {<<"GET">>, <<"/play/pi.go">>},
      {<<"GET">>, <<"/play/sieve.go">>},
      {<<"GET">>, <<"/play/solitaire.go">>},
      {<<"GET">>, <<"/play/tree.go">>},
      {<<"GET">>, <<"/progs/">>},
      {<<"GET">>, <<"/progs/cgo1.go">>},
      {<<"GET">>, <<"/progs/cgo2.go">>},
      {<<"GET">>, <<"/progs/cgo3.go">>},
      {<<"GET">>, <<"/progs/cgo4.go">>},
      {<<"GET">>, <<"/progs/defer.go">>},
      {<<"GET">>, <<"/progs/defer.out">>},
      {<<"GET">>, <<"/progs/defer2.go">>},
      {<<"GET">>, <<"/progs/defer2.out">>},
      {<<"GET">>, <<"/progs/eff_bytesize.go">>},
      {<<"GET">>, <<"/progs/eff_bytesize.out">>},
      {<<"GET">>, <<"/progs/eff_qr.go">>},
      {<<"GET">>, <<"/progs/eff_sequence.go">>},
      {<<"GET">>, <<"/progs/eff_sequence.out">>},
      {<<"GET">>, <<"/progs/eff_unused1.go">>},
      {<<"GET">>, <<"/progs/eff_unused2.go">>},
      {<<"GET">>, <<"/progs/error.go">>},
      {<<"GET">>, <<"/progs/error2.go">>},
      {<<"GET">>, <<"/progs/error3.go">>},
      {<<"GET">>, <<"/progs/error4.go">>},
      {<<"GET">>, <<"/progs/go1.go">>},
      {<<"GET">>, <<"/progs/gobs1.go">>},
      {<<"GET">>, <<"/progs/gobs2.go">>},
      {<<"GET">>, <<"/progs/image_draw.go">>},
      {<<"GET">>, <<"/progs/image_package1.go">>},
      {<<"GET">>, <<"/progs/image_package1.out">>},
      {<<"GET">>, <<"/progs/image_package2.go">>},
      {<<"GET">>, <<"/progs/image_package2.out">>},
      {<<"GET">>, <<"/progs/image_package3.go">>},
      {<<"GET">>, <<"/progs/image_package3.out">>},
      {<<"GET">>, <<"/progs/image_package4.go">>},
      {<<"GET">>, <<"/progs/image_package4.out">>},
      {<<"GET">>, <<"/progs/image_package5.go">>},
      {<<"GET">>, <<"/progs/image_package5.out">>},
      {<<"GET">>, <<"/progs/image_package6.go">>},
      {<<"GET">>, <<"/progs/image_package6.out">>},
      {<<"GET">>, <<"/progs/interface.go">>},
      {<<"GET">>, <<"/progs/interface2.go">>},
      {<<"GET">>, <<"/progs/interface2.out">>},
      {<<"GET">>, <<"/progs/json1.go">>},
      {<<"GET">>, <<"/progs/json2.go">>},
      {<<"GET">>, <<"/progs/json2.out">>},
      {<<"GET">>, <<"/progs/json3.go">>},
      {<<"GET">>, <<"/progs/json4.go">>},
      {<<"GET">>, <<"/progs/json5.go">>},
      {<<"GET">>, <<"/progs/run">>},
      {<<"GET">>, <<"/progs/slices.go">>},
      {<<"GET">>, <<"/progs/timeout1.go">>},
      {<<"GET">>, <<"/progs/timeout2.go">>},
      {<<"GET">>, <<"/progs/update.bash">>}]}.

param() ->
    {param, [{<<"GET">>, <<"/user/gordon">>}]}.

param5() ->
    {param5, [{<<"GET">>, <<"/test/test/test/test/test">>}]}.

param20() ->
    {param20, [{<<"GET">>, <<"/a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t">>}]}.

param_write() ->
    {param_write, [{<<"GET">>, <<"/user/gordon">>}]}.

parse_static() ->
    {parse, [{<<"GET">>, <<"/1/users">>}]}.

parse_param() ->
    {parse, [{<<"GET">>, <<"/1/classes/go">>}]}.

parse_2params() ->
    {parse, [{<<"GET">>, <<"/1/classes/go/123456789">>}]}.

parse_all() ->
    {parse,
     [{<<"POST">>, <<"/1/classes/_className">>},
      {<<"GET">>, <<"/1/classes/_className/123456789">>},
      {<<"PUT">>, <<"/1/classes/_className/123456789">>},
      {<<"GET">>, <<"/1/classes/_className">>},
      {<<"DELETE">>, <<"/1/classes/_className/123456789">>},

      {<<"POST">>, <<"/1/users">>},
      {<<"GET">>, <<"/1/login">>},
      {<<"GET">>, <<"/1/users/123456789">>},
      {<<"PUT">>, <<"/1/users/123456789">>},
      {<<"GET">>, <<"/1/users">>},
      {<<"DELETE">>, <<"/1/users/123456789">>},
      {<<"POST">>, <<"/1/requestPasswordReset">>},

      {<<"POST">>, <<"/1/roles">>},
      {<<"GET">>, <<"/1/roles/123456789">>},
      {<<"PUT">>, <<"/1/roles/123456789">>},
      {<<"GET">>, <<"/1/roles">>},
      {<<"DELETE">>, <<"/1/roles/123456789">>},

      {<<"POST">>, <<"/1/files/_fileName">>},
      {<<"POST">>, <<"/1/events/_eventName">>},
      {<<"POST">>, <<"/1/push">>},

      {<<"POST">>, <<"/1/installations">>},
      {<<"GET">>, <<"/1/installations/123456789">>},
      {<<"PUT">>, <<"/1/installations/123456789">>},
      {<<"GET">>, <<"/1/installations">>},
      {<<"DELETE">>, <<"/1/installations/123456789">>},

      {<<"POST">>, <<"/1/functions">>}]}.


gplus_static() ->
    {gplus, [{<<"GET">>, <<"/people">>}]}.

gplus_param() ->
    {gplus, [{<<"GET">>, <<"/people/118051310819094153327">>}]}.

gplus_2params() ->
    {gplus, [{<<"GET">>, <<"/people/118051310819094153327/activities/123456789">>}]}.

gplus_all() ->
    {gplus,
     [{<<"GET">>, <<"/people/12345678">>},
      {<<"GET">>, <<"/people">>},
      {<<"GET">>, <<"/activities/12345678901/people/12345678901">>},
      {<<"GET">>, <<"/people/1234567/people/12345678901">>},
      {<<"GET">>, <<"/people/1234567/openIdConnect">>},

      {<<"GET">>, <<"/people/1234567/activities/12345678901">>},
      {<<"GET">>, <<"/activities/12345678901">>},
      {<<"GET">>, <<"/activities">>},

      {<<"GET">>, <<"/activities/12345678901/comments">>},
      {<<"GET">>, <<"/comments/1234567890">>},

      {<<"POST">>, <<"/people/1234567/moments/12345678901">>},
      {<<"GET">>, <<"/people/1234567/moments/12345678901">>},
      {<<"DELETE">>, <<"/moments/123">>}
     ]}.
