defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/(?=.*[a-z]\?+$)$/) -> "Sure."
      String.match?(input, ~r/^[^a-z]*[^?]$/) -> "Whoa, chill out!"
      String.match?(input, ~r/^[^a-z]*\?+$/) -> "Calm down, I know what I'm doing!"
      String.match?(input, ~r/^[\s\t]*$/) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
