defmodule TwelveDays do
  @number_map %{
    1 => ["first", "and a Partridge", "a Partridge"],
    2 => ["second", "two Turtle Doves"],
    3 => ["third", "three French Hens"],
    4 => ["fourth", "four Calling Birds"],
    5 => ["fifth", "five Gold Rings"],
    6 => ["sixth", "six Geese-a-Laying"],
    7 => ["seventh", "seven Swans-a-Swimming"],
    8 => ["eighth", "eight Maids-a-Milking"],
    9 => ["ninth", "nine Ladies Dancing"],
    10 => ["tenth", "ten Lords-a-Leaping"],
    11 => ["eleventh", "eleven Pipers Piping"],
    12 => ["twelfth", "twelve Drummers Drumming"] 
  }
  def make_str(number) do
    case number do
    1 ->  Enum.at(@number_map[1], 2)
    _ ->  Enum.reduce(1..number,[], fn x, result -> [Enum.at(@number_map[x], 1)| result] end)
          |> Enum.join(", ")
    end
  end

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    first_str = Enum.at(@number_map[number], 0)
    second_str = make_str(number)
    "On the #{first_str} day of Christmas my true love gave to me: #{second_str} in a Pear Tree."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.reduce(starting_verse..ending_verse,[], fn x, result -> result ++ [verse(x)] end)
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
