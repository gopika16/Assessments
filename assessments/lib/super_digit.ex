defmodule SuperDigit do
  def super_digit(number, times) do
    if number > 0 && times > 0 do
      number
      |> generate_p(times)
      |> String.to_charlist()
      |> calculate_super_digit(0)
      |> sum_super_digit
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

  defp sum_super_digit(digit) do
    digits = Integer.digits(digit)
    if length(digits) > 1 do
      digits
      |> get_sum(0)
    else
      digit
    end
  end

  defp get_sum([head | tail], sum) do
    get_sum(tail, sum + head)
  end

  defp get_sum([], sum), do: sum_super_digit(sum)
end
