defmodule SumOfMultiples do
  defp checkRem(number, factor) when rem(number, factor) == 0, do: true 
  defp checkRem(_, _), do: false

  def check(number, factors) do
    result = Enum.reduce(factors,[], fn x, result -> result ++ [checkRem(number, x)] end)
    if true in result, do: true, else: false
  end
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.reduce(1..(limit - 1), 0, fn (s, result) ->  if check(s, factors), do: result + s, else: result end)
  end
end
