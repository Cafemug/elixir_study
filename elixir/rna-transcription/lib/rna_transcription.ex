defmodule RnaTranscription do
  @c_map %{
    ?G => 67,
    ?C => 71,
    ?T => 65,
    ?A => 85
  }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna,fn x -> @c_map[x] end)
  end
end
