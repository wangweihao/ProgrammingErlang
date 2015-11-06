-module(math_function).
-export([math_functions/1, odds_and_events_acc/3]).


%列表推导
%math_functions(L) ->
%    Odd = [X || X <- L, (X rem 2) =:= 1],
%    Event = [X || X <- L, (X rem 2) =:= 0],
%    {Odd, Event}.

%filter
%math_functions(L) ->
%    lists:filter(fun(X) -> X rem 2 =:= 0 end, L).


%归集器
math_functions(L) ->
    odds_and_events_acc(L, [], []).

odds_and_events_acc([H|T], Odds, Events) ->
    case (H rem 2) of
        1 -> odds_and_events_acc(T, [H|Odds], Events);
        0 -> odds_and_events_acc(T, Odds, [H|Events])
    end;

odds_and_events_acc([], Odds, Events) ->
    {lists:reverse(Odds), lists:reverse(Events)}.
