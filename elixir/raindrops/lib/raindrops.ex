defmodule Raindrops do
  defp factor(n, 3) when rem(n,3) == 0, do: "Pling"
  defp factor(n, 5) when rem(n,5) == 0, do: "Plang"
  defp factor(n, 7) when rem(n,7) == 0, do: "Plong"
  defp factor(_, _), do: ""
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    str = factor(number, 3) <> factor(number, 5) <> factor(number, 7)
    if str == "", do: Integer.to_string(number), else: str
  end
end
