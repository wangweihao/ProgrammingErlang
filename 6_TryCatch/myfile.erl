-module(myfile).
-export([read/1]).


read(File) ->
    try file:read_file(File) of
        File -> {File, ok}
    catch 
        throw:File -> {File, error, erlang:get_stacktrace()}
    end.
