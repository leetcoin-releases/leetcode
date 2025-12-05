defmodule Solution do
  @spec count_and_say(n :: integer) :: String.t
  def count_and_say(1), do: "1"
  def count_and_say(n) do
    Enum.reduce(2..n, "1", fn _, acc -> say(acc) end)
  end
  defp say(str) do
    str
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map(fn chunk -> Integer.to_string(length(chunk)) <> hd(chunk) end)
    |> Enum.join()
  end
end