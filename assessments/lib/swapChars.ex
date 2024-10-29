defmodule SwapChars do
  def swapChars(originalString) do
    originalString
    |> to_charlist
    |> swapChar("")
  end

  defp swapChar([head | tail], finalString) do
    [nextHead | updatedTail] = tail
    swapChar(updatedTail, finalString <> <<nextHead>> <> <<head>>)
  end

  defp swapChar([], finalString), do: finalString
end
