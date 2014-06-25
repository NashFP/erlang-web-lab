%% hello_app.erl - Boilerplate required to make things work, for unknown reasons.
%%
%% Without this file, it is possible to start the server by running `erl` and
%% doing `hello_sup:start_link().` However, the corresponding `erl -eval` or
%% `erl -s` command lines do not work and do not generate any error output!
%%
%% My best theory is that OTP starts up after `-eval` and `-s` code runs, and
%% also `-eval` and `-s` code does not generate any error output when it
%% crashes. (?)
%%
%% We have not solved the mystery, but adding this code makes it possible to
%% start the server from the command line. (Read `../run.sh` to see how.)
%% hello.app.src is related metadata, part of the interface that OTP
%% applications must implement.

-module(hello_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    hello_sup:start_link().

stop(_State) ->
    ok.
