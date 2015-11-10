-module(start).
-export([start/2]).

start(AnAtom, Fun) ->
    register(AnAtom, spawn(Fun)).
