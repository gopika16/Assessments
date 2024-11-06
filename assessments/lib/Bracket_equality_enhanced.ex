defmodule BracketEqualityEnhanced do
  @brackets %{?[ => ?], ?{ => ?}, ?( => ?)}
  @open_brackets Map.keys(@brackets)
  @close_brackets Map.values(@brackets)

  def check_bracket_equality?(input_string) do
    input_string = to_charlist(input_string)

    if rem(length(input_string), 2) === 0 do
      input_string
      |> isEqual?([])
    else
      false
    end
  end

  defp isEqual?([], []), do: true

  defp isEqual?([head | tail], stack) when head in @open_brackets do
    isEqual?(tail, [head | stack])
  end

  defp isEqual?([head | tail], [top | stack]) when head in @close_brackets do
    if @brackets[top] === head or top in @open_brackets do
      isEqual?(tail, stack)
    else
      isEqual?(tail, stack)
    end
  end

  defp isEqual?(_, _), do: false
end
