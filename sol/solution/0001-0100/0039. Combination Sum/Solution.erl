-spec combination_sum(Candidates :: [integer()], Target :: integer()) -> [[integer()]].
combination_sum(Candidates, Target) ->
    Sorted = lists:sort(Candidates),
    combinations(Sorted, Target, []).
combinations(_Candidates, 0, Current) ->
    [lists:reverse(Current)];
combinations([], _Target, _Current) ->
    [];
combinations([C | Rest] = Candidates, Target, Current) ->
    if
        C > Target ->
            [];
        true ->
            WithC = combinations(Candidates, Target - C, [C | Current]),
            WithoutC = combinations(Rest, Target, Current),
            WithC ++ WithoutC
    end.