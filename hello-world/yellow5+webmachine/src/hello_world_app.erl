%% @author Cameron Dykes <yellow5c@gmail.com>
%% @copyright 2014 author.

%% @doc Callbacks for the hello_world application.

-module(hello_world_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for hello_world.
start(_Type, _StartArgs) ->
    hello_world_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for hello_world.
stop(_State) ->
    ok.
