defmodule Solution do
  @spec combination_sum(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum(candidates, target) do
    candidates
    |> Enum.sort()
    |> backtrack(target, [], 0)
  end
  defp backtrack(candidates, 0, current, _index) do
    [Enum.reverse(current)]
  end
  defp backtrack(candidates, target, current, index) when target < 0 do
    []
  end
  defp backtrack(candidates, target, current, index) do
    Enum.flat_map(index..(length(candidates) - 1), fn i ->
      c = Enum.at(candidates, i)
      backtrack(candidates, target - c, [c | current], i)
    end)
  end
end