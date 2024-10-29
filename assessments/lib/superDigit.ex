defmodule SuperDigit do
  def super_digit(number, times) do
    if number > 0 && times > 0 do
      number
      |> generateP(times)
      |> String.to_charlist
      |> calculateSuperDigit(0)
    else
      "Positive Values only"
    end
  end

  defp generateP(number, times) when times > 0 do
    Integer.to_string(number) <> generateP(number, times - 1)
  end

  defp generateP(_, 0), do: ""

  defp calculateSuperDigit([head | tail], superDigit) do
    currentDigit = String.to_integer(<<head>>)
    calculateSuperDigit(tail, superDigit + currentDigit)
  end

  defp calculateSuperDigit([], superDigit), do: superDigit
end
