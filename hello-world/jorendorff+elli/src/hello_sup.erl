%% hello_sup.erl - A supervisor to restart the server when it crashes.
%%
%% Elli is designed to be run by a supervisor. Therefore this file contains
%% both options required by Elli (the port number, for example) and
%% supervisor-related options (documented at
%% <http://www.erlang.org/doc/design_principles/sup_princ.html>).

-module(hello_sup).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    ElliOpts = [{callback, hello_elli}, {port, 3000}],
    ElliSpec = {
        elli_this_is_jorendorffs_app,
        {elli, start_link, [ElliOpts]},
        permanent,
        5000,
        worker,
        [ham_sandwich]},

    {ok, { {one_for_one, 5, 10}, [ElliSpec]} }.
