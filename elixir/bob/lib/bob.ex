defmodule Bob do
defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp yell?(input) do
    String.upcase(input) == input && String.upcase(input) != String.downcase(input)
  end
  def hey(input) do
    input = String.trim(input)

    cond do
      input == "" ->
        "Fine. Be that way!"

      yell?(input) && question?(input) ->
        "Calm down, I know what I'm doing!"

      yell?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
