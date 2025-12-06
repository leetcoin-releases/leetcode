-spec combination_sum2(Candidates :: [integer()], Target :: integer()) -> [[integer()]].
combination_sum2(Candidates, Target) ->
    Sorted = lists:sort(Candidates),
    combination_sum2_helper(Sorted, Target, [], []).
combination_sum2_helper(_, 0, CurrentCombination, Result) -> 
    [lists:reverse(CurrentCombination) | Result];
combination_sum2_helper([], _, _, Result) -> 
    Result;
combination_sum2_helper([H | _], Target, _, Result) when H > Target -> 
    Result;
combination_sum2_helper(Candidates, Target, CurrentCombination, Result) ->
    backtrack(Candidates, Target, CurrentCombination, Result).
backtrack([], _, _, Result) -> 
    Result;
backtrack([H | _], Target, _, Result) when H > Target -> 
    Result;
backtrack([H | T], Target, CurrentCombination, Result) ->
    % Include current element
    Result1 = combination_sum2_helper(T, Target - H, [H | CurrentCombination], Result),
    % Skip duplicates
    T2 = skip_duplicates(H, T),
    % Exclude current element and continue
    backtrack(T2, Target, CurrentCombination, Result1).
skip_duplicates(_, []) -> [];
skip_duplicates(Val, [H | T]) when H == Val -> skip_duplicates(Val, T);
skip_duplicates(_, List) -> List.