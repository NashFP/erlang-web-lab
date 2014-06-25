%% @doc: Elli example callback
%%
%% Your callback needs to implement two functions, handle/2 and
%% handle_event/3. For every request, Elli will call your handle
%% function with the request. When an event happens, like Elli
%% completed a request, there was a parsing error or your handler
%% threw an error, handle_event/3 is called.

-module(elli_example_callback).
-export([handle/2, handle_event/3]).

-include("../include/elli.hrl").
-behaviour(elli_handler).

-include_lib("kernel/include/file.hrl").

%%
%% ELLI REQUEST CALLBACK
%%

handle(Req, _Args) ->
    %% Delegate to our handler function
    handle(Req#req.method, elli_request:path(Req), Req).

handle('GET',[], Req) ->
  {ok, [], <<"Hello World!">>};

handle(_, _, _Req) ->
    {ok, [], <<"Hello World">>}.

handle_event(_Event, _Data, _Args) ->
  ok.
