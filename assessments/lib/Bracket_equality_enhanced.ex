defmodule BracketEqualityEnhanced do
  @brackets %{?[ => ?], ?{ => ?}, ?( => ?)}
  @open_brackets Map.keys(@brackets)
  @close_brackets Map.values(@brackets)

  def check_bracket_equality?(input_string) do
    input_string = to_charlist(input_string)

    if rem(length(input_string), 2) === 0 do
      input_string
      |> is_equal?([])
    else
      false
    end
  end

  defp is_equal?([], []), do: true

  defp is_equal?([head | tail], stack) when head in @open_brackets do
    is_equal?(tail, [head | stack])
  end

  defp is_equal?([head | tail], [top | stack]) when head in @close_brackets do
    if @brackets[top] === head or top in @open_brackets do
      is_equal?(tail, stack)
    else
      is_equal?(tail, stack)
    end
  end

  defp is_equal?(_, _), do: false
end
