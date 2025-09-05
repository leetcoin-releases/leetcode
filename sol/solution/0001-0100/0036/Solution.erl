-spec is_valid_sudoku(Board :: [[char()]]) -> boolean().
is_valid_sudoku(Board) ->
    rows(Board) andalso cols(Board) andalso squares(Board).
rows(Board) ->
    lists:all(fun(Row) -> row(Row) end, Board).
row(Row) ->
    Filled = [X || X <- Row, X =/= $.],
    sets:size(sets:from_list(Filled)) =:= length(Filled).
cols([[] | _]) ->
    true;
cols(Board) ->
    Col = [hd(Row) || Row <- Board],
    Filled = [X || X <- Col, X =/= $.],
    case sets:size(sets:from_list(Filled)) =/= length(Filled) of
        true ->
            false;
        false ->
            cols([tl(Row) || Row <- Board])
    end.
squares([[] | _]) ->
    true;
squares(Board) ->
    ThreeCols = [[A, B, C] || [A, B, C | _] <- Board],
    [A, B, C, D, E, F, G, H, I] = ThreeCols,
    Squares = [[A, B, C], [D, E, F], [G, H, I]],
    case lists:all(fun(Square) -> square(Square) end, Squares) of
        false ->
            false;
        true ->
            squares([T || [_, _, _ | T] <- Board])
    end.
square(Square) ->
    L = lists:flatten(Square),
    Filled = [X || X <- L, X =/= $.],
    sets:size(sets:from_list(Filled)) =:= length(Filled).