-module(web).
-export([start/1]).

start(Listen) ->
    spawn_link(fun () -> 
                       {ok, Socket} = gen_tcp:listen(Listen, [{active, false}]),
                       loop(Socket)
               end).

handle(C) ->
    gen_tcp:send(C, response(<<"Hello from gen_tcp with a smile :)">>)),
    gen_tcp:close(C).

response(In) when is_binary(In) ->
    iolist_to_binary(io_lib:fwrite("HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ~p\n\n~s",[erlang:byte_size(In), In])).

loop(S) ->
    {ok, C} = gen_tcp:accept(S),
    Handler = spawn_link(fun () ->
                                 handle(C)
                         end),
    gen_tcp:controlling_process(C, Handler),
    loop(S).
