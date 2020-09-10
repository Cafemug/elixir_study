defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-", "_", "~r/[A-Z]/"] ,trim: true)
    |> Enum.reduce("", fn x, result -> result <> String.slice(String.capitalize(x),0, 1) end)
  end
end
