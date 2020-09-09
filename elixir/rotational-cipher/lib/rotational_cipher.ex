defmodule RotationalCipher do
  defp shiftChar(char, shift) do
  <<v::utf8>> = char
  char = v + shift
    cond do
      v >= 65 && v < 91 -> List.to_string([div(char, 91) * 65 + rem(char, 91)])
      v >= 97 && v < 123->  List.to_string([div(char, 123) * 97 + rem(char, 123)])
      true -> List.to_string([v])
      end
  end
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.split("",trim: true)
    |> Enum.map(fn x-> shiftChar(x, shift) end)
    |> Enum.join("")
  end
end
