-module(area_server1).
-export([loop/0, rpc/2, start/0]).

start() -> spawn(area_server1, loop, []).

% 客户端
rpc(Pid, Request) ->
    Pid ! {self(), Request}, %对方的Pid，self()是自己的Pid
    receive 
        {Pid, Response} ->   %接受对方的消息
            Response
    end.

% 服务器
loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! {self(), Width * Ht},
            loop();
        {From, {circle, R}} ->
            From ! {self(), 3.14159 * R * R},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
    after 0 -> 
            true
    end.
