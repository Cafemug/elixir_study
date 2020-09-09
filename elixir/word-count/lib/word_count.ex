defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([":", "!", "&", "@", "$", "%", "^", ",", " ", "_"], trim: true)
    |> word_count(%{})
  end

  @spec word_count(List.t(), Map.t()) :: map
  def word_count(word_list, c_map) do
    c_map = Enum.reduce(word_list, %{}, fn (s, map) ->  Map.update(map, s, 1, &(&1 + 1)) end)
    c_map
    end
  
end
