-module(bench_plain).

-export([run/3]).

-export(
   [static/2,
    param/2,
    param5/2,
    param20/2,
    param_write/2,
    parse/2,
    gplus/2
   ]).

run(Handler, Method, <<$/, Path/binary>>) ->
    ?MODULE:Handler(Method, binary:split(Path, <<"/">>, [global])).


static(<<"GET">>, [<<"">>]) ->
    ok;
static(<<"GET">>, [<<"cmd.html">>]) ->
    ok;
static(<<"GET">>, [<<"code.html">>]) ->
    ok;
static(<<"GET">>, [<<"contrib.html">>]) ->
    ok;
static(<<"GET">>, [<<"contribute.html">>]) ->
    ok;
static(<<"GET">>, [<<"debugging_with_gdb.html">>]) ->
    ok;
static(<<"GET">>, [<<"docs.html">>]) ->
    ok;
static(<<"GET">>, [<<"effective_go.html">>]) ->
    ok;
static(<<"GET">>, [<<"files.log">>]) ->
    ok;
static(<<"GET">>, [<<"gccgo_contribute.html">>]) ->
    ok;
static(<<"GET">>, [<<"gccgo_install.html">>]) ->
    ok;
static(<<"GET">>, [<<"go-logo-black.png">>]) ->
    ok;
static(<<"GET">>, [<<"go-logo-blue.png">>]) ->
    ok;
static(<<"GET">>, [<<"go-logo-white.png">>]) ->
    ok;
static(<<"GET">>, [<<"go1.1.html">>]) ->
    ok;
static(<<"GET">>, [<<"go1.2.html">>]) ->
    ok;
static(<<"GET">>, [<<"go1.html">>]) ->
    ok;
static(<<"GET">>, [<<"go1compat.html">>]) ->
    ok;
static(<<"GET">>, [<<"go_faq.html">>]) ->
    ok;
static(<<"GET">>, [<<"go_mem.html">>]) ->
    ok;
static(<<"GET">>, [<<"go_spec.html">>]) ->
    ok;
static(<<"GET">>, [<<"help.html">>]) ->
    ok;
static(<<"GET">>, [<<"ie.css">>]) ->
    ok;
static(<<"GET">>, [<<"install-source.html">>]) ->
    ok;
static(<<"GET">>, [<<"install.html">>]) ->
    ok;
static(<<"GET">>, [<<"logo-153x55.png">>]) ->
    ok;
static(<<"GET">>, [<<"Makefile">>]) ->
    ok;
static(<<"GET">>, [<<"root.html">>]) ->
    ok;
static(<<"GET">>, [<<"share.png">>]) ->
    ok;
static(<<"GET">>, [<<"sieve.gif">>]) ->
    ok;
static(<<"GET">>, [<<"tos.html">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"go_command.html">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"index.html">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"edit.html">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"final-noclosure.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"final-noerror.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"final-parsetemplate.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"final-template.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"final.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"get.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"http-sample.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"index.html">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"Makefile">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"notemplate.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"part1-noerror.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"part1.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"part2.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"part3-errorhandling.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"part3.go">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"test.bash">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"test_edit.good">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"test_Test.txt.good">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"test_view.good">>]) ->
    ok;
static(<<"GET">>, [<<"articles">>, <<"wiki">>, <<"view.html">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"codewalk.css">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"codewalk.js">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"codewalk.xml">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"functions.xml">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"markov.go">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"markov.xml">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"pig.go">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"popout.png">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"run">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"sharemem.xml">>]) ->
    ok;
static(<<"GET">>, [<<"codewalk">>, <<"urlpoll.go">>]) ->
    ok;
static(<<"GET">>, [<<"devel">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"devel">>, <<"release.html">>]) ->
    ok;
static(<<"GET">>, [<<"devel">>, <<"weekly.html">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"appenginegopher.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"appenginegophercolor.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"appenginelogo.gif">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"bumper.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"bumper192x108.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"bumper320x180.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"bumper480x270.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"bumper640x360.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"doc.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"frontpage.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"gopherbw.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"gophercolor.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"gophercolor16x16.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"help.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pkg.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"project.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"ref.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"run.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"talks.png">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gopherhat.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gopherhelmet.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gophermega.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gopherrunning.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gopherswim.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"gopher">>, <<"pencil">>, <<"gopherswrench.jpg">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"fib.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"hello.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"life.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"peano.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"pi.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"sieve.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"solitaire.go">>]) ->
    ok;
static(<<"GET">>, [<<"play">>, <<"tree.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"cgo1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"cgo2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"cgo3.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"cgo4.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"defer.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"defer.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"defer2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"defer2.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_bytesize.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_bytesize.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_qr.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_sequence.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_sequence.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_unused1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"eff_unused2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"error.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"error2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"error3.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"error4.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"go1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"gobs1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"gobs2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_draw.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package1.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package2.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package3.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package3.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package4.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package4.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package5.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package5.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package6.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"image_package6.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"interface.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"interface2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"interface2.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json2.out">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json3.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json4.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"json5.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"run">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"slices.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"timeout1.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"timeout2.go">>]) ->
    ok;
static(<<"GET">>, [<<"progs">>, <<"update.bash">>]) ->
    ok.

param(<<"GET">>, [<<"user">>, _Name]) ->
    ok.

param5(<<"GET">>, [_A,_B,_C,_D,_E]) ->
    ok.

param20(<<"GET">>, [_A,_B,_C,_D,_E,_F,_G,_H,_I,_J,_K,_L,_M,_N,_O,_P,_Q,_R,_S,_T]) ->
    ok.

param_write(<<"GET">>, [<<"user">>, Name]) ->
    ok = file:write_file("/dev/null", Name).

parse(M, [<<"1">>, <<"classes">>, _ClassName])
  when M =:= <<"GET">>; M =:= <<"POST">> ->
    ok;
parse(M, [<<"1">>, <<"classes">>, _ClassName, _ObjectID])
  when M =:= <<"GET">>; M =:= <<"PUT">>; M =:= <<"DELETE">> ->
    ok;
parse(<<"GET">>, [<<"1">>, <<"login">>]) ->
    ok;
parse(<<"POST">>, [<<"1">>, <<"requestPasswordReset">>]) ->
    ok;
parse(M, [<<"1">>, <<"users">>])
  when M =:= <<"GET">>; M =:= <<"POST">> ->
    ok;
parse(M, [<<"1">>, <<"users">>, _ObjectID])
  when M =:= <<"GET">>; M =:= <<"PUT">>; M =:= <<"DELETE">> ->
    ok;
parse(<<"POST">>, [<<"1">>, <<"files">>, _FileName]) ->
    ok;
parse(<<"POST">>, [<<"1">>, <<"events">>, _EventName]) ->
    ok;
parse(<<"POST">>, [<<"1">>, <<"push">>]) ->
    ok;
parse(M, [<<"1">>, <<"roles">>])
  when M =:= <<"GET">>; M =:= <<"POST">> ->
    ok;
parse(M, [<<"1">>, <<"roles">>, _ObjectID])
  when M =:= <<"GET">>; M =:= <<"PUT">>; M =:= <<"DELETE">> ->
    ok;
parse(M, [<<"1">>, <<"installations">>])
  when M =:= <<"GET">>; M =:= <<"POST">> ->
    ok;
parse(M, [<<"1">>, <<"installations">>, _ObjectID])
  when M =:= <<"GET">>; M =:= <<"PUT">>; M =:= <<"DELETE">> ->
    ok;
parse(<<"POST">>, [<<"1">>, <<"functions">>]) ->
    ok.


gplus(<<"GET">>, [<<"people">>, _UserId]) ->
    ok;
gplus(<<"GET">>, [<<"people">>]) ->
    ok;
gplus(<<"GET">>, [<<"activities">>, _ActivityId, <<"people">>, _Collection]) ->
    ok;
gplus(<<"GET">>, [<<"people">>, _UserId, <<"people">>, _Collection]) ->
    ok;
gplus(<<"GET">>, [<<"people">>, _UserId, <<"openIdConnect">>]) ->
    ok;
gplus(<<"GET">>, [<<"people">>, _UserId, <<"activities">>, _Collection]) ->
    ok;
gplus(<<"GET">>, [<<"activities">>, _ActivityId]) ->
    ok;
gplus(<<"GET">>, [<<"activities">>]) ->
    ok;
gplus(<<"GET">>, [<<"activities">>, _ActivityId, <<"comments">>]) ->
    ok;
gplus(<<"GET">>, [<<"comments">>, _CommentID]) ->
    ok;
gplus(<<"POST">>, [<<"people">>, _UserId, <<"moments">>, _Collection]) ->
    ok;
gplus(<<"GET">>, [<<"people">>, _UserId, <<"moments">>, _Collection]) ->
    ok;
gplus(<<"DELETE">>, [<<"moments">>, _Id]) ->
    ok.

