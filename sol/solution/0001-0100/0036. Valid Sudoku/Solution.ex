defmodule Solution do
  @regions for(r <- 0..8, do: for(c <- 0..8, do: r * 9 + c))
           ++ for(c <- 0..8, do: for(r <- 0..8, do: r * 9 + c))     
           ++ for(s_r <- 0..8 // 3, s_c <- 0..8 // 3, s_i =  s_r * 9 + s_c, do:
                    for(r <- 0..2, c <- 0..2, do: s_i + r * 9 + c))
  @max_allowed_per_region Enum.map(1..9, &?0 + &1) ++ List.duplicate(?., 9)
  @spec is_valid_sudoku(board :: [[char]]) :: boolean
  def is_valid_sudoku(board), 
    do: 
        board
        |> IO.iodata_to_binary()
        |> to_charlist()
        |> List.to_tuple()
        |> then(
            fn board -> Enum.all?(@regions, 
                fn region -> Enum.empty?(
                    Enum.map(region, &elem(board, &1)) -- @max_allowed_per_region)
                end)        
            end)  
end