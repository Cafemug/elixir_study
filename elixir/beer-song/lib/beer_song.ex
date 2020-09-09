defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    if number >0 do
      """
      #{number} bottles of beer on the wall, #{number} bottles of beer.
      Take one down and pass it around, #{number - 1} bottles of beer on the wall.
      """
    else
      """
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      """
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    for n <- range, do: verse(n)
  end
  @spec lyrics() :: String.t()
  def lyrics() do
    for n <- 99..0, do: verse(n)
  end
end
