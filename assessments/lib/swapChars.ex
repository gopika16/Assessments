defmodule SwapChars do
  def swap_chars(original_string) do
    original_string
    |> to_charlist
    |> swap_character("")
  end

  defp swap_character([head | tail], final_string) do
    [next_head | updated_tail] = tail
    swap_character(updated_tail, final_string <> <<next_head>> <> <<head>>)
  end

  defp swap_character([], final_string), do: final_string
end
