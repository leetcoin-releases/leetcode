-spec count_and_say(N :: integer()) -> unicode:unicode_binary().
count_and_say(1) -> <<"1">>;
count_and_say(N) when N > 1 ->
    count_and_say(N, <<"1">>).
count_and_say(1, Res) -> Res;
count_and_say(N, Res) ->
    Next = encode(Res),
    count_and_say(N - 1, Next).
encode(<<>>) ->
    <<>>;
encode(Bin) when is_binary(Bin) ->
    List = binary_to_list(Bin),
    case List of
        [] -> <<>>;
        [H | T] ->
            list_to_binary(lists:reverse(encode(T, 1, H, [])))
    end.
encode([], Count, Prev, Acc) ->
    [[integer_to_list(Count), Prev] | Acc];
encode([H | T], Count, Prev, Acc) when H =:= Prev ->
    encode(T, Count + 1, Prev, Acc);
encode([H | T], Count, Prev, Acc) ->
    encode(T, 1, H, [[integer_to_list(Count), Prev] | Acc]).