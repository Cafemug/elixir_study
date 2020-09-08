defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    num_list = String.split(number, "", trim: true)
  end
  def recur([], result), do: return result
  def recur([num | tail], result) do
    str_result = 
    recur(tail, result)
  end

  def make_rom(num, length) do
    case length do
      0 ->
      1 ->
      2 ->
      3 -> *'M'
    end
  end
end
