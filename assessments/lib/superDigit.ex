defmodule Super_digit do
  def super_digit(number, times) do
    if number > 0 && times > 0 do
      number
      |> generate_p(times)
      |> String.to_charlist
      |> calculate_super_digit(0)
    else
      "Positive Values only"
    end
  end

  defp generate_p(number, times) when times > 0 do
    Integer.to_string(number) <> generate_p(number, times - 1)
  end

  defp generate_p(_, 0), do: ""

  defp calculate_super_digit([head | tail], super_digit) do
    current_digit = String.to_integer(<<head>>)
    calculate_super_digit(tail, super_digit + current_digit)
  end

  defp calculate_super_digit([], super_digit), do: super_digit
end
