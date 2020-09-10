defmodule Anagram do
  defp check_component(base_str, candidate_str) do
    base_str = String.upcase(base_str)
    candidate_str = String.upcase(candidate_str)
    b_map = Enum.reduce(String.split(base_str,"",trim: true), %{}, fn (s, map) ->  Map.update(map, s, 1, &(&1 + 1)) end)
    c_map = Enum.reduce(String.split(candidate_str,"",trim: true), %{}, fn (s, map) ->  Map.update(map, s, 1, &(&1 + 1)) end)
    if b_map == c_map, do: true, else: false
  end
  
  defp check_len(base_str, candidate_str) do
    if String.length(base_str) == String.length(candidate_str), do: true, else: false
  end

  defp check_origin(base_str, candidate_str) do
    if String.upcase(base_str) == String.upcase(candidate_str), do: false, else: true
  end

  defp get_component(base_str, candidate_str) do
    if check_component(base_str, candidate_str) && check_len(base_str, candidate_str) && check_origin(base_str, candidate_str), do: [candidate_str], else: []
  end
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.reduce(candidates, [], fn (x, result) -> result ++ get_component(base, x) end)
  end
end
