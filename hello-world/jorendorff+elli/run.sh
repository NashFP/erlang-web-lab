#!/bin/bash
# run.sh - Script to run the hello world server.
set -e   # quit if an error occurs

rebar get-deps
rebar compile
erl -pa deps/*/ebin ebin -eval 'application:start(hello)'
# Ctrl-C twice to exit.
