-module(afile_client).
-export([ls/1, get_file/2, put_file/1]).


ls(Server) -> 
    Server ! {self(), list_dir},
    receive
        {Server, FileList} ->
            FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive
        {Server, Content} ->
            Content
    end.

put_file(FileName) -> 
    read_file(FileName) -> {ok, Binary} | {error, Reason}

