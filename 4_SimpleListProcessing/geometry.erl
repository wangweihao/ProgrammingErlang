-module(geometry).
-export([caculate/1]).

caculate({triangle, One, Two}) ->
    One * Two div 2;
    
caculate({square, Side}) ->
    Side * Side.


