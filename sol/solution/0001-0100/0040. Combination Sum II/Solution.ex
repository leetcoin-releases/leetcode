defmodule Solution do
    @spec combination_sum2(candidates :: [integer], target :: integer) :: [[integer]]
    def combination_sum2(candidates, target) do
        candidates |> Enum.sort()
                   |> combination_sum(target)
    end
    def combination_sum(cs, t)
    def combination_sum(_, 0), do: [[]]
    def combination_sum([], _), do: []
    def combination_sum([c|cs], t) do
        case Enum.sum([c|cs]) do
            x when x == t -> [[c|cs]]
            x when x < t -> []
            x when x > t ->
                left = cond do 
                    c > t -> []
                    c <= t -> 
                        diff = t - c
                        cs |> Enum.filter(&(&1 <= diff))
                           |> combination_sum(diff)
                           |> Enum.map(&[c|&1])
                        end
                right = cs |> Enum.drop_while(&(&1 == c))
                           |> Enum.filter(&(&1 <= t))
                           |> combination_sum(t)
                if length(left) < length(right) do
                    left ++ right
                else
                    right ++ left
                end
            end
    end
end