defmodule BracketEquality do
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
    # IO.inspect(tail, label: "Current Tail")
    # IO.inspect([head | stack], label: "Current Stack")
    isEqual?(tail, [head | stack])
  end

  defp isEqual?([head | tail], [top | stack]) when head in @close_brackets do
    # IO.inspect(tail, label: "Next Tail")
    # IO.inspect(stack, label: "Next Stack")
    if @brackets[top] === head do
      isEqual?(tail, stack)
    else
      false
    end
  end

  defp isEqual?(_, _), do: false
end
