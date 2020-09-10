defmodule Scrabble do
  @score_map %{
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
  }
  def map_alpha(word) do
    word = String.upcase(word)
    cond do
      Enum.member?(@score_map[1], word)  -> 1
      Enum.member?(@score_map[2], word)  -> 2
      Enum.member?(@score_map[3], word)  -> 3
      Enum.member?(@score_map[4], word)  -> 4
      Enum.member?(@score_map[5], word)  -> 5
      Enum.member?(@score_map[8], word)  -> 8
      Enum.member?(@score_map[10], word)  -> 10
      true -> 0
    end
  end
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn x, result -> result + map_alpha(x) end)
  end
end
