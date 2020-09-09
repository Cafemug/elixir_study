defmodule Strain do
  def keepList(item, list, flag) do
    cond do
      flag -> list ++ [item]
      true -> list
    end
  end

  def discardList(item, list, flag) do
    cond do
      flag -> list
      true -> list ++ [item]
    end
  end
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reduce(list,[], fn x, result -> keepList(x, result, apply(fun,[x])) end)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    Enum.reduce(list,[], fn x, result -> discardList(x, result, apply(fun,[x])) end)
  end
end
