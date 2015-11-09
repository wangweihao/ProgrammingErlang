-module(myMaps).
-module(maps).
-export([myMaps/1]).

myMaps(X) ->
    maps:to_json(X).
