defmodule MingleStrings do
  def mingleStrings(firstString, secondString) do
    firstString = String.to_charlist(firstString)
    secondString = String.to_charlist(secondString)

    ""
    |> mixStrings(firstString, secondString)
  end

  defp mixStrings(finalString, [firsthead | firsttail], [secondhead | secondtail]) do
    (finalString <> <<firsthead>> <> <<secondhead>>) |> mixStrings(firsttail, secondtail)
  end

  defp mixStrings(finalValue, [], []), do: finalValue
  defp mixStrings(finalValue, firstList, []), do: finalValue <> (firstList |> to_string())
  defp mixStrings(finalValue, [], secondList), do: finalValue <> (secondList |> to_string())
end
