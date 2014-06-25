%% hello_elli.erl - This is the core of the program.
%%
%% It implements the elli_handler behavior, which means anyone
%% can start an HTTP server using this code by doing
%% elli:start_link(hello_elli).
%%
%% For routing, we depend on Erlang pattern matching.

-module(hello_elli).
-export([handle/2, handle_event/3]).

-include_lib("elli/include/elli.hrl").
-behaviour(elli_handler).

%% This is the entry point used by Elli. For routing, we extract the bits of
%% the request that we want to match on, then pass those to handle/3.
handle(Req, _Args) ->
    %% Delegate to our handler function
    handle(Req#req.method, elli_request:path(Req), Req).

handle('GET', [], _Req) ->
    %% Reply with a normal response. 'ok' can be used instead of '200'
    %% to signal success.
    {ok, [{<<"Content-type">>, "text/html"}], <<"<h1>hello world">>};

handle(_, _, _Req) ->
    {404, [], <<"Not Found">>}.

%% @doc: Handle request events, like request completed, exception
%% thrown, client timeout, etc. Must return 'ok'.
handle_event(_Event, _Data, _Args) ->
    ok.
