-module(calculate).
-export([loop/0, start/0]).

start() -> spawn(calculate, loop, []).

loop() ->
    receive 
        {plus, Num1, Num2} ->
            io:format("Num1 plus Num2 result:~p~n", [Num1 + Num2]),
            loop();
        {reduce, Num1, Num2} ->
            io:format("Num1 reduce Num2 result:~p~n", [Num1 - Num2]),
            loop();
        {multi, Num1, Num2} ->
            io:format("Num1 multi Num2 result:~p~n", [Num1 * Num2]),
            loop();
        {divis, Num1, Num2} ->
            io:format("Num1 divis Num2 result:~p~n", [Num1 div Num2]),
            loop()
    after 50000 ->
              io:format("timeout!!")
    end().
