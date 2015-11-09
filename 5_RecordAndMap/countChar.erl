-module(countChar).
-export([count_characters/1]).

count_characters(Str) ->
    count_characters(Str, #{}).

count_characters([H|T],  #{ H => N } = X) ->
    count_characters(T, X#{ H := N+1 });
count_characters([H|T], X) ->
    count_characters(T, X#{ H => 1 });
count_characters([], X) -> 
    X.

%count_characters(Str) ->
%    count_characters(Str, #{}).
%
%count_characters([H|T], X) ->
%    case maps:is_key(H,X) of
%        false -> count_characters(T, X#{ H => 1});
%        true  -> #{ H := Count } = X,
%                count_characters(T, X#{ H := Count+1})
%    end;
%count_characters([], X) ->
%    X.
